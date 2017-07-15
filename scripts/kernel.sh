#!/bin/bash -eux

# Remove previous kernel headers
yum remove kernel-headers

# Install Newest Kernel
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
yum --enablerepo=elrepo-kernel -y install kernel-ml.x86_64 kernel-ml-headers.x86_64
sed -i 's/^GRUB_DEFAULT=saved/GRUB_DEFAULT=0/g' /etc/default/grub
grub2-mkconfig -o /boot/grub2/grub.cfg
