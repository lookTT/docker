docker run -d --name v2ray -v /home/v2ray:/etc/v2ray -p 40725:40725 --restart=always v2ray/official  v2ray -config=/home/v2ray/config.json
