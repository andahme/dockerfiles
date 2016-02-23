#!/bin/bash


PG_TEST_FILE="/var/lib/postgresql/9.5/main/PG_VERSION"


if [ -e "${PG_TEST_FILE}" ]; then
    echo "Detected Existing Database..."
else
    echo "Run this image with the init tag to initialize a database."
    exit 1
fi


/usr/lib/postgresql/9.5/bin/postgres -c config-file=/etc/postgresql/9.5/main/postgresql.conf

