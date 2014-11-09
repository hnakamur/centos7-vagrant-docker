#!/bin/sh
if [ ! -f /usr/bin/consul ]; then
  CONSUL_ZIP_FILE=0.4.1_linux_amd64.zip
  yum install -y unzip
  curl -LO https://dl.bintray.com/mitchellh/consul/$CONSUL_ZIP_FILE
  unzip $CONSUL_ZIP_FILE
  install consul /bin/consul -o root -g root -m 0755
  rm $CONSUL_ZIP_FILE consul
fi
