#!/bin/bash

# clean all packages:
echo "==> Cleaning packages"
yum clean packages
echo "==> Cleaning metadata"
yum clean metadata
echo "==> Cleaning headers"
yum clean headers
echo "==> Cleaning all"
yum clean all
