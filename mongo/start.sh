
yum install docker
systemctl enable docker
systemctl start docker
# 创建一个挂载盘
docker volume create mongodb
# 拉镜像
docker pull mongo
# 启动docker
docker run --name mongodb -p 27017:27017 -v mongodb:/data/db/ -d mongo --auth

# docker exec -it mongodb /bin/bash
# mongo
#  > use admin
#  > db.createUser({user:'root',pwd:'root',roles:[{role:"root",db:"admin"}]})
#  > use test
#  > db.createUser({user:'test',pwd:'test',roles:[{role:"readWrite",db:"test"}]})