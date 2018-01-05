
# Start docker service 
systemctl start docker

# Enable docker service to start with OS on reboots 
systemctl enable docker

# Verify docker service
systemctl status docker


# pull mongodb image from Docker hub
docker pull mongo:3.6

# run mongodb container
docker run -d --restart=always \
  -v /root/database/:/data/db \
  --name mongodb \
  mongo:3.6 mongod --smallfiles --nohttpinterface --replSet rs0

# configure replica set, and create oplog user
docker exec -it mongodb mongo

# in the mongo console, remember use better password
use admin
rs.initiate()
db.createUser({user: "oplogger", pwd: "master", roles: [{role: "read", db: "local"}]});