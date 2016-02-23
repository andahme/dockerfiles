#!/bin/bash


chown -R redis:redis /var/lib/redis
chmod 700 /var/lib/redis


exec su redis -c "redis-server"

