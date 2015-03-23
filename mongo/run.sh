#!/bin/bash


chown -R mongodb:mongodb /var/lib/mongodb
chmod 700 /var/lib/mongodb


exec su mongodb -c "/usr/bin/mongod --dbpath=/var/lib/mongodb"

