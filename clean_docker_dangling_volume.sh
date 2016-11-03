#!/bin/bash
docker volume ls -f dangling=true | awk '{print $2}' | sed -n '2,$ p' |xargs docker volume rm
