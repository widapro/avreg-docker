#!/bin/bash

_cleanup() {
        echo "Stopping services..."

        service avreg stop
        service apache2 stop
        service mysql stop
        service memcached stop

        kill -s SIGTERM $!

        echo "...container stopped."

        exit 0
}

echo "Starting services..."

# remove any service pids in case if container was incorrectly killed
service avreg stop
service apache2 stop
service mysql stop
service memcached stop

#change owner for mysql docker volume
chown -R mysql:mysql /var/lib/mysql

service mysql start
service apache2 start
service avreg start
service memcached start

echo "...services started."

trap _cleanup SIGTERM
trap _cleanup SIGINT

while [ 1 ]
do
  sleep 60 &
  wait $!
done
