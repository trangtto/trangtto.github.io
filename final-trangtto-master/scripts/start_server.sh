#!/bin/bash
docker network create -d overlay --subnet 10.2.0.0/24 pets-overlay
docker network ls
docker service create --network pets-overlay --name db consul
docker service ps db
docker service create --network pets-overlay --replicas 2 -p 80:5000 -e 'DB=db' --name web chrch/docker-pets:1.0
docker service ps web

