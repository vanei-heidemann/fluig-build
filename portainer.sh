#!/bin/sh
docker run -d -p 9000:9000 --name "portainer.io" --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer:/data portainer/portainer
