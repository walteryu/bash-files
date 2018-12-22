#!/bin/bash

# free memory in loop or by command
# while true; do echo "freeing up memory..."; sync && sudo purge; sleep 60; done

echo "==> Running sync and purge"
sync & sudo purge
echo "==> Running killall chrome"
killall \"Google Chrome Helper\"
