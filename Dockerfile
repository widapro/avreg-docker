FROM debian:stretch

# add avreg repository to sources
RUN echo "deb http://avreg.net/repos/6.3-html5/debian/ stretch main contrib non-free" >> /etc/apt/sources.list

# remove policy to allow start services while apt-get install
RUN echo exit 0 > /usr/sbin/policy-rc.d

# install avreg and remove
RUN DEBIAN_FRONTEND=noninteractive \
apt-get update && \
apt-get install dialog apt-utils -y && \
apt-get install -y --allow-unauthenticated avreg-server-mysql && \
service avreg stop

# change default web UI port to 81
RUN sed -i 's/Listen 80/Listen 81/g' /etc/apache2/ports.conf

# entry point will start mysql, apache2, and avreg services and stop them as well on demand
ADD entry_point.sh /
CMD ["/entry_point.sh"]

EXPOSE 81
