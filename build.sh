#!/bin/bash
docker build -t bekkere/ionic2-docker:latest .

docker run -t -i bekkere/ionic2-docker:latest /bin/bash
