#!/bin/bash


PG_TEST_FILE="/var/lib/postgresql/${PG_MAJOR}/main/PG_VERSION"


if [ -e "${PG_TEST_FILE}" ]; then
    echo "Located Existing Database..."
else
    echo "Unable to locate PG_VERSION file."

    exit 1
fi


exec /usr/lib/postgresql/${PG_MAJOR}/bin/postgres -c config-file=/etc/postgresql/${PG_MAJOR}/main/postgresql.conf

