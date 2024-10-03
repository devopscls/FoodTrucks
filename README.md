SF Food Trucks
===

> San Francisco's finger-licking street food now at your fingertips.

![img](shot.png)

#### Docker
```
step1: docker search elasticsearch
step2: docker pull docker.elastic.co/elasticsearch/elasticsearch:6.3.2
step3: docker run -d --name es -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.3.2
step4: docker container ls
step5: docker container logs es
step6: curl from local port
{
  "name" : "KALL50D",
  "cluster_name" : "docker-cluster",
  "cluster_uuid" : "yDFMRM-PSUyYha24CEpeug",
  "version" : {
    "number" : "6.3.2",
    "build_flavor" : "default",
    "build_type" : "tar",
    "build_hash" : "053779d",
    "build_date" : "2018-07-20T05:20:23.451332Z",
    "build_snapshot" : false,
    "lucene_version" : "7.3.1",
    "minimum_wire_compatibility_version" : "5.6.0",
    "minimum_index_compatibility_version" : "5.0.0"
  },
  "tagline" : "You Know, for Search"
}
Step7: build your docker image ( docker build -t vishal/foodtrucks-web . )
Step8: docker run -P --rm vishal/foodtrucks-web
Step9: docker ps / docker container ls
Step10: docker network ls
Step11: docker network inspect bridge
Step12: exec into your container:
--> docker run -it --rm vishal/foodtrucks-web bash
--> do a curl: curl 172.17.0.2:9200
--> exit from container
Step13: docker network create foodtrucks-net
Step14: docker network ls
Step15: docker container stop es
Step16: docker container rm es
Step17: docker run -d --name es --net foodtrucks-net -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.3.2
Step18: docker network inspect foodtrucks-net
Step19: docker run -it --rm --net foodtrucks-net vishal/foodtrucks-web bash
--> curl es:9200
--> python3 app.py
--> exit from container
Step20: docker run -d --net foodtrucks-net -p 5000:5000 --name foodtrucks-web vishal/foodtrucks-web
```
##### Docker Network
```
$ ./setup-docker.sh
```

##### Docker Compose
```
$ curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /home/ec2-user/.local/bin/docker-compose
chmod +x /home/ec2-user/.local/bin/docker-compose
docker-compose version
```

##### Docker Compose
```
$ docker-compose up
```

The app can also be easily deployed on AWS Elastic Container Service. Once you have [aws ecs cli](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_CLI_installation.html) installed, you can run the following to deploy it on ECS!
```
$ ./setup-aws-ecs.sh
```
