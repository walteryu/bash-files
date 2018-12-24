#!/bin/bash -eux

echo "==> Clean up yum cache of metadata and packages to save space"
yum -y --enablerepo='*' clean all

echo "==> Removing temporary files used to build box"
rm -rf /tmp/*

echo "==> Rebuild RPM DB"
rpmdb --rebuilddb
rm -f /var/lib/rpm/__db*

# delete any logs that have built up during the install
find /var/log/ -name *.log -exec rm -f {} \;

# clear memory
sync

echo "==> Disk usage before cleanup"
echo "${DISK_USAGE_BEFORE_CLEANUP}"

echo "==> Disk usage after cleanup"
df -h

# clean all packages:
yum clean packages
yum clean metadata
yum clean headers
yum clean all
