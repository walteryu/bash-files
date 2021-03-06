#!/bin/bash

# reference: https://github.com/boxcutter/ubuntu/blob/master/script/cleanup.sh
echo "==> Cleaning up tmp"
rm -rf /tmp/*

# Clean up log files
find /var/log -type f | while read f; do echo -ne '' > "${f}"; done;

echo "==> Clearing last login information"
>/var/log/lastlog
>/var/log/wtmp
>/var/log/btmp

# Make sure we wait until all the data is written to disk, otherwise
# Packer might quite too early before the large files are deleted
echo "==> Running sync"
sync

# apt-get update with sudo
# echo "==> Running apt autoclean"
# sudo apt autoclean
# echo "==> Running apt-get clean"
# sudo apt-get clean
# echo "==> Running apt autoremove"
# sudo apt autoremove --purge

# run last:
# echo "==> Running localepurge"
# sudo apt install localepurge

# apt-get update with sudo
echo "==> Running apt autoclean"
apt autoclean
echo "==> Running apt-get clean"
apt-get clean
echo "==> Running apt autoremove"
apt autoremove --purge

# echo "==> Installing git"
# apt-get install git-core
# echo "==> Installing vim"
# apt-get install vim-gtk

# run last:
echo "==> Running localepurge"
apt install localepurge
