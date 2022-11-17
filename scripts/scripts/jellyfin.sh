#!/bin/bash
docker run -d \
 --name jellyfin \
 --user 1000:1000 \
 --net=host \
 --volume /home/karu/Server/jellyfin/config:/config \
 --volume /home/karu/Server/jellyfin/cache:/cache \
 --mount type=bind,source=/repositorio/,target=/media \
 --restart=unless-stopped \
 jellyfin/jellyfin

