#!/bin/bash -e

COMMAND=$1; shift
case ${COMMAND} in
    init | initdb | postgres)
        if [ ! -d ${PGDATA} ]; then
            echo "ANDAHME Initializing Database - INITDB_AUTH_OPTIONS (${INITDB_AUTH_OPTIONS:=--username ${INITDB_BOOTSTRAP_USERNAME:-postgres} --pwfile=${INITDB_BOOTSTRAP_PWFILE:=/dev/shm/pg_password}})"
            echo """${INITDB_BOOTSTRAP_PASSWORD:-2345}""" > /dev/shm/pg_password && unset INITDB_BOOTSTRAP_PASSWORD
            /usr/lib/postgresql/${PG_MAJOR}/bin/initdb --auth ${INITDB_BOOSTRAP_AUTH:-md5} ${INITDB_AUTH_OPTIONS} | sed -r -e "s| -D ${PGDATA}||g" -e "s/ -l logfile//g"
            rm -f /dev/shm/pg_password
        fi
        ;;&
    init | initsql | postgres)
        if [ -d /docker-init-sql ]; then
            for DOCKER_INIT_SQL in /docker-init-sql/*.sql; do
                echo "ANDAHME Applying Configuration - DOCKER_INIT_SQL (${DOCKER_INIT_SQL})"
                postgres --single -F -c exit_on_error=true < ${DOCKER_INIT_SQL} > /dev/null
            done

            echo
        fi
        ;;&
    init | initdb | initsql)
        ;;
    noinit | postgres)
        exec postgres $@
        ;;
    *)
        exec ${COMMAND} $@
        ;;
esac

