#!/bin/sh

# This script is based on https://media-glass.es/2014/11/02/latest-docker-centos7
# Thanks for a nice script!

# Download the binary & set the permissions
curl -L https://get.docker.com/builds/Linux/x86_64/docker-latest > /usr/bin/docker; chmod +x /usr/bin/docker

# Download the systemd files
curl -L https://raw.githubusercontent.com/docker/docker/master/contrib/init/systemd/docker.service > /usr/lib/systemd/system/docker.service
curl -L https://raw.githubusercontent.com/docker/docker/master/contrib/init/systemd/docker.socket > /usr/lib/systemd/system/docker.socket

# Enable & start the service
systemctl enable docker
systemctl start docker

# Install Fig as well
curl -L https://github.com/docker/fig/releases/download/1.0.0/fig-`uname -s`-`uname -m` > /usr/bin/fig; chmod +x /usr/bin/fig
