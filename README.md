# Docker-Ionic2

  ![Logo](https://t3.ftcdn.net/jpg/00/88/29/92/160_F_88299226_zDCwpd0g45FKNMbJzuh7N1gXH45Xze2p.jpg)

By [bekkere]

## Description
**Docker-Ionic2** Docker container for Ionic2 Framework

## Installation

Pull the image:

```console
docker pull bekkere/docker-ionic2
```
Create a alias for simple execution: 

```console
alias ionic="docker run -ti --rm -p 8100:8100 -p 35729:35729 -v \$PWD:/myApp:rw bekkere/docker-ionic2:latest ionic"

```

## Usage

Run the container using:

```console
ionic start MyApp --v2
ionic serve --lab -b # http://localhost:8100/ionic-lab
```
