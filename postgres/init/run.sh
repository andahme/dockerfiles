#!/bin/bash


PG_TEST_FILE="/var/lib/postgresql/PG_VERSION"


if [ -e "${PG_TEST_FILE}" ]; then
    echo "Detected Existing Database..."
    exit 1
else
    echo "Initializing Database..."
    pg_createcluster 9.5 main -- $@

    sed -i -r "s/^#?(listen_addresses = ')[0-9A-Za-z\.]*(').*$/\1\*\2/g" /etc/postgresql/9.5/main/postgresql.conf

    echo 'host all all 0.0.0.0/0 md5' >> /etc/postgresql/9.5/main/pg_hba.conf
fi

