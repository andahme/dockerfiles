#!/bin/bash


PG_TEST_FILE="/var/lib/postgresql/PG_VERSION"


if [ -e "${PG_TEST_FILE}" ]; then
    echo "Detected Existing Database..."
else
    echo "Initializing Database..."
    cp -Rf /var/lib/postgres-template/* /var/lib/postgresql
fi

chown -R postgres:postgres /var/lib/postgresql
chmod 700 /var/lib/postgresql


exec su postgres -c "/usr/lib/postgresql/9.4/bin/postgres -c config-file=/etc/postgresql/9.4/main/postgresql.conf"

