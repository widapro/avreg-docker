# avreg-docker
Avreg video recorder server docker image. Base on 6.3-html5 stable version of avreg-server.

### Pre requirements
To build and start avreg server docker container you need to install
* docker
* docker-compose

### Build image
1. Make `entry_point.sh` executable and grand necessary rights
```
chmod 777 entry_point.sh
chmod +x entry_point.sh
```

2. Build avreg docker image
```
docker build -t avreg-server .
```

3. Tag avreg docker image
```
docker tag avreg-server:latest avreg-server:6.3
```

### Run avreg-server in docker compose
1. Create data folder
```
mkdir -p /data/avreg
```
2. Run avreg-server container
```
docker-compose -f avreg-docker-compose.yml up -d
```

#### Connect to avreg-server
Avreg will be available on `81` port on all interfaces `0.0.0.0`
