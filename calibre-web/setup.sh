#!/bin/bash

#docker安装并配置开机启动
yum install docker
systemctl enable docker
systemctl start docker

#拉取镜像
docker pull linuxserver/calibre-web

#启动
docker run -d \
  --name=calibre-web \
  -e PUID=0 \
  -e PGID=0 \
  -e TZ=Asia/Shanghai \
  -e DOCKER_MODS=linuxserver/mods:universal-calibre \
  -e OAUTHLIB_RELAX_TOKEN_SCOPE=1 \
  -p 8083:8083 \
  -v /data/docker/calibre/config:/config \
  -v /data/docker/calibre/books:/books \
  --restart unless-stopped \
  lscr.io/linuxserver/calibre-web:latest

#进入容器内部配置
docker exec -it calibre-web /bin/bash
    cd /app/calibre/bin
    calibredb restore_database --really-do-it --with-library /books
    chmod a+w /books/metadata.db
    exit