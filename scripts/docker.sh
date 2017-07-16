#!/bin/bash -eux

# Install Docker
yum -y install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/docker-ce-17.06.0.ce-1.el7.centos.x86_64.rpm

systemctl enable docker
systemctl start docker
