# Ionic 2 developer container
# Use at your own risk! I have not tested any deployment, created my own as all the others did not work!
# alias ionic="docker run -ti --rm -p 8100:8100 -p 35729:35729 -v \$PWD:/myApp:rw bekkere/ionic2-framework:latest ionic"
# then use ionic serve on localhost:8100

FROM ubuntu:16.04

MAINTAINER bekkere <bekkere@gmail.com>

LABEL Description="Ionic 2 Framework Dev container using /myApp volume, expose port 8100 and 35729, for your app directories"

RUN apt-get update

RUN apt-get install -y -q \
    curl

# As of 03-jul-16: Ionic is not yet ready for Node.js 6, see https://github.com/driftyco/ionic-cli/issues/960
# RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -

# install nodejs, npm and git
RUN apt-get install -y -q \
            nodejs \
            git \
            && apt-get -y autoclean \
            && rm -rf /var/lib/apt/lists/*

# install ionic, cordova, typescript, gulp
RUN npm install -g -y ionic
RUN npm install -g -y cordova
RUN npm install -g -y typescript
RUN npm install -g -y gulp

RUN echo ' Create a alias for quick launch ...' > /Readme.txt
RUN echo ' alias ionic=docker run -ti --rm -p 8100:8100 -p 35729:35729 -v \$PWD:/myApp:rw bekkere/ionic2-framework:latest ionic' >> /Readme.txt
RUN echo ''
RUN echo ' Installed the following packages:' >> /Readme.txt
RUN echo ' --> Ubuntu 16.04, with curl' >> /Readme.txt
RUN echo ' --> Nodejs version 5.x, git' >> /Readme.txt
RUN echo ' --> NPM install globally ionic, cordova, typescript, gulp' >> /Readme.txt
RUN echo ' ' >> /Readme.txt
RUN echo ' NOTE: Do not run npm update -g npm ... reinstalling npm v3 fails on Docker' >> /Readme.txt

RUN echo 'cd /myApp' > /start.sh
RUN echo 'cat /Readme.txt' >> /start.sh

WORKDIR /myApp

CMD bash -C '/start.sh';'bash'

EXPOSE 8100 35729

# Do NOT use VOLUME statement as it may result in orphaned volumes
# docker run --rm ... bash
# VOLUME /myApp
