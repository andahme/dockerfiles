#!/bin/bash


PG_TEST_FILE="/var/lib/postgresql/PG_VERSION"


if [ -e "${PG_TEST_FILE}" ]; then
    echo "Located Existing Database!"

    exit 1
fi


echo "Initializing Database..."

pg_createcluster ${PG_MAJOR} main -- $@

sed -i -r "s/^#?(listen_addresses = ')[0-9A-Za-z\.]*(').*$/\1\*\2/g" /etc/postgresql/${PG_MAJOR}/main/postgresql.conf

echo 'host all all 0.0.0.0/0 md5' >> /etc/postgresql/${PG_MAJOR}/main/pg_hba.conf

