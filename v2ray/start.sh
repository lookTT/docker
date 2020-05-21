yum install docker
systemctl enable docker
systemctl start docker

docker run -d --name v2ray -v /home/v2ray:/etc/v2ray -p 12345:12345 --restart=always v2ray/official v2ray -config=/home/v2ray/config.json
