#!/bin/bash
sudo apt update -y
sudo apt install default-jre -y
wait
sudo mkdir -p /data/dictrl
sudo useradd -d /data/dictrl -m dictrl -p clearsense@123
sudo su - root
cp /etc/skel/.* /data/dictrl/
sleep 5
chown dictrl:dictrl -R /data/dictrl/