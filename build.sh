#!/bin/bash
docker build -t bekkere/docker-ionic2:latest .

docker run -t -i bekkere/docker-ionic2:latest /bin/bash
