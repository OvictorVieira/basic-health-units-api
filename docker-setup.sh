#!/bin/bash
docker-compose -f docker/docker-compose.yml build --no-cache

docker-compose -f docker/docker-compose.yml up -d

bash ./initiate-work.sh
