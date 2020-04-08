#!/bin/bash
docker-compose build

docker-compose up -d

docker exec -it basic-health-units bash
