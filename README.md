# hombre-ser2net
![Docker Pulls](https://img.shields.io/docker/pulls/hombrelab/hombre-ser2net) ![Docker Image Version (latest by date)](https://img.shields.io/docker/v/hombrelab/hombre-ser2net) ![GitHub commit activity](https://img.shields.io/github/last-commit/hombrelab/hombre-ser2net)  

The [hombre-ser2net](https://hub.docker.com/repository/docker/hombrelab/hombre-ser2net) image is based on the [hombre-alpine](https://hub.docker.com/repository/docker/hombrelab/hombre-alpine) image and [ser2net](https://linux.die.net/man/8/ser2net).  
It is a Docker image for and by [@Hombrelab](me@hombrelab.com) to forward a serial port to the network.

Deployment examples:

Command line
```shell script
docker run \
    --name ser2net \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro \
    --device /dev/ttyUSB0:/dev/ttyUSB0 \
    --publish 2001:2001 \
    hombrelab/hombre-ser2net
```
Docker Compose
```yaml
    ser2net:
        container_name: ser2net
        restart: unless-stopped
        image: hombrelab/hombre-ser2net
        volumes:
            - /etc/localtime:/etc/localtime:ro
        devices:
            - /dev/ttyUSB0:/dev/ttyUSB0
        ports:
            - 2001:2001
```
Test ([manual](https://www.commandlinux.com/man-page/man1/nc.1.html))
```shell script
nc -zv 192.168.0.10 2001
```