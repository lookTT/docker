#!/bin/bash

#docker安装并配置开机启动
yum install docker
systemctl enable docker
systemctl start docker

#拉取gitlab镜像
docker pull gitlab/gitlab-ce

#启动gitlab
docker run -d \
    --publish 443:443 --publish 80:80 --publish 22:22 \
    --name gitlab \
    --volume /home/gitlab/config:/etc/gitlab \
    --volume /home/gitlab/logs:/var/log/gitlab \
    --volume /home/gitlab/data:/var/opt/gitlab \
    --restart=always \
    gitlab/gitlab-ce