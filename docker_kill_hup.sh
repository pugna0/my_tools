#!/bin/bash

# author: pugna

# Script for Nginx to reload.
# Replace "CONTAINER_NAME" before using.

CONTAINER_NAME='XXXX'

PID=$(docker inspect --format {{.State.Pid}} $CONTAINER_NAME)
nsenter --target $PID --mount --uts --ipc --net --pid kill -HUP 1
