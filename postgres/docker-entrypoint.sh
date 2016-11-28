#!/bin/bash -e

if [[ $1 == initdb ]]; then
    shift

    pg_createcluster ${PG_MAJOR} main -- --pwprompt $@

    sed -i -r "s/^(host.*)127\.0\.0\.1\/32(.*)$/\10\.0\.0\.0\/0   \2/g" /etc/postgresql/${PG_MAJOR}/main/pg_hba.conf
    sed -i -r "s/^#(listen_addresses = ')[0-9A-Za-z\.]*(').*$/\1\*\2/g" /etc/postgresql/${PG_MAJOR}/main/postgresql.conf
elif [[ $1 == single ]]; then
    exec /usr/lib/postgresql/${PG_MAJOR}/bin/postgres --single -c config-file=/etc/postgresql/${PG_MAJOR}/main/postgresql.conf
elif [[ -e /var/lib/postgresql/${PG_MAJOR}/main/PG_VERSION ]]; then
    exec /usr/lib/postgresql/${PG_MAJOR}/bin/postgres -c config-file=/etc/postgresql/${PG_MAJOR}/main/postgresql.conf
else
    echo Database not found.  Starting interactive shell...

    exec /bin/bash
fi

