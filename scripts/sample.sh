#!/bin/bash
sudo mkdir -p /data/dictrl
sudo useradd -d /data/dictrl -m dictrl -p clearsense@123
sudo su - root
cp /etc/skel/.* /data/dictrl/
sleep 5
chown dictrl:dictrl -R /data/dictrl/
sleep 10
sudo apt install default-jre -y
wait
