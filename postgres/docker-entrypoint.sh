#!/bin/bash -e

if [ $1 == "postgres" -a ! -d ${PGDATA} ]; then
    if [ -z """${PGPASSWORD}""" -a -t 0 ]; then
        initdb --auth md5 --username ${PGUSER:-postgres} --pwprompt
    else
        echo """${PGPASSWORD}""" > /tmp/pgpassword
        initdb --auth md5 --username ${PGUSER:-postgres} --pwfile=/tmp/pgpassword
        rm -f /tmp/pgpassword
    fi

    if [ -n "${PGDATABASE}" -a "${PGDATABASE}" != "postgres" ]; then
        echo "ALTER DATABASE postgres RENAME TO ${PGDATABASE};" | postgres --single template0 -F -c exit_on_error=true > /dev/null
    fi
fi

exec $@

