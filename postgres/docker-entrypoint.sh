#!/bin/bash -e

if [[ $# == 0 ]]; then
    exec /usr/lib/postgresql/${PG_MAJOR}/bin/postgres -c config-file=/etc/postgresql/${PG_MAJOR}/main/postgresql.conf
fi

COMMAND=$1; shift
case ${COMMAND} in
    initdb)
        exec pg_createcluster ${PG_MAJOR} main -- $@
        ;;
    single)
        exec /usr/lib/postgresql/${PG_MAJOR}/bin/postgres --single -c config-file=/etc/postgresql/${PG_MAJOR}/main/postgresql.conf $@
        ;;
    postgres)
        exec /usr/lib/postgresql/${PG_MAJOR}/bin/postgres -c config-file=/etc/postgresql/${PG_MAJOR}/main/postgresql.conf $@
        ;;
    psql)
        if [ "${DB_PORT_5432_TCP_ADDR}" -a "${DB_PORT_5432_TCP_PORT}" ]; then
            exec psql -h ${DB_PORT_5432_TCP_ADDR} -p ${DB_PORT_5432_TCP_PORT} $@
        else
            exec psql $@
        fi
        ;;
    *)
        exec ${COMMAND} $@
        ;;
esac

