#!/bin/bash


chown -R cassandra:cassandra /var/lib/cassandra
chmod 700 /var/lib/cassandra


exec su cassandra -c "/usr/sbin/cassandra -f"

