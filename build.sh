#!/bin/bash
docker build -t bekkere/ionic2-framework:latest .

docker run -t -i bekkere/ionic2-framework:latest /bin/bash
