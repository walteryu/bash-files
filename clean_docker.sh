#!/bin/bash
docker rmi $(docker images -q -f dangling=true)
docker volume rm $(docker volume ls -qf dangling=true)

# view disk usage:
df -h

# see running containers:
docker ps

# view system info:
docker system info

# view stored images:
docker images

# delete orphaned and dangling volumes:
docker volume rm $(docker volume ls -qf dangling=true)

# delete dangling and untagged images:
docker rmi $(docker images -q -f dangling=true)

# delete stopped containers, volumes and networks:
docker system prune -a
