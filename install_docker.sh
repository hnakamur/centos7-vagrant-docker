#!/bin/sh

# This script is based on https://media-glass.es/2014/11/02/latest-docker-centos7
# Thanks for a nice script!

# Download the binary & set the permissions
if [ ! -f /bin/docker ]; then
  curl -L -o /bin/docker https://get.docker.com/builds/Linux/x86_64/docker-latest
  chmod +x /bin/docker
fi

# Download the systemd files
if [ ! -f /usr/lib/systemd/system/docker.service ]; then
  curl -L -o /usr/lib/systemd/system/docker.service https://raw.githubusercontent.com/docker/docker/master/contrib/init/systemd/docker.service
  curl -L -o /usr/lib/systemd/system/docker.socket https://raw.githubusercontent.com/docker/docker/master/contrib/init/systemd/docker.socket

  # Enable & start the service
  systemctl enable docker
  systemctl start docker
fi

# Install Fig as well
if [ ! -f /bin/fig ]; then
  curl -L -o /bin/fig https://github.com/docker/fig/releases/download/1.0.0/fig-`uname -s`-`uname -m`
  chmod +x /bin/fig
fi
