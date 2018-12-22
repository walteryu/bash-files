#!/bin/bash

# free memory in loop or by command
# while true; do echo "freeing up memory..."; sync && sudo purge; sleep 60; done

sync & sudo purge
killall \"Google Chrome Helper\"
