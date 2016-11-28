#!/bin/bash -e

if [ "$1" == "initdb" ]; then
    shift

    pg_createcluster ${PG_MAJOR} main -- --pwprompt $@

    sed -i -r "s/^#(listen_addresses = ')[0-9A-Za-z\.]*(').*$/\1\*\2/g" /etc/postgresql/${PG_MAJOR}/main/postgresql.conf

    echo host all all 0.0.0.0/0 md5 >> /etc/postgresql/${PG_MAJOR}/main/pg_hba.conf

    echo Creation complete.
elif [ -e "/var/lib/postgresql/${PG_MAJOR}/main/PG_VERSION" ]; then
    exec /usr/lib/postgresql/${PG_MAJOR}/bin/postgres -c config-file=/etc/postgresql/${PG_MAJOR}/main/postgresql.conf
else
    echo Database not found.  Starting interactive shell...

    exec /bin/bash
fi

