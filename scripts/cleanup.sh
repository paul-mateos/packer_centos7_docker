#!/bin/bash

yum -y clean all

# Cleanup log files
find /var/log -type f | while read f; do echo -ne '' > $f; done;

# remove under tmp directory
rm -rf /tmp/*

dd if=/dev/zero of=/EMPTY bs=1M
rm -rf /EMPTY
