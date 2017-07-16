#!/bin/bash

SSH_USER=${SSH_USERNAME:-vagrant}
SSH_USER_HOME=${SSH_USER_HOME:-/home/${SSH_USER}}

yum -y install bzip2 gcc kernel-devel

echo "==> Installing VirtualBox guest additions"
# Assume that we've installed all the prerequisites:
# kernel-headers-$(uname -r) kernel-devel-$(uname -r) gcc make perl
# from the install media via ks.cfg

VBOX_VERSION=$(cat $SSH_USER_HOME/.vbox_version)
mount -o loop $SSH_USER_HOME/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run --nox11

umount /mnt
rm -rf $SSH_USER_HOME/VBoxGuestAdditions_$VBOX_VERSION.iso
rm -f $SSH_USER_HOME/.vbox_version

ln -s --force /opt/VBoxGuestAdditions-$VBOX_VERSION/lib/VBoxGuestAdditions/mount.vboxsf /sbin/

echo "==> Removing packages needed for building guest tools"
yum -y remove bzip2 gcc kernel-devel
