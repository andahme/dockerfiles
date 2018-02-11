#!/bin/bash -e

COMMAND=$1; shift
case ${COMMAND} in
    initdb)
        echo "ANDAHME Initializing Database - INITDB_OPTIONS (${INITDB_OPTIONS:=--auth md5 --pwprompt})"
        exec initdb ${INITDB_OPTIONS} $@ | sed s/\ \-D.*logfile//g
        ;;
    noinitdb)
        exec postgres $@
        ;;
    postgres)
        if [ ! -d ${PGDATA} ]; then
            echo "ANDAHME Initializing Database - INITDB_OPTIONS (${INITDB_OPTIONS:=--auth md5 --pwfile=/tmp/pg_password})"
            initdb ${INITDB_OPTIONS} | sed s/\ \-D.*logfile//g
        fi

        exec postgres $@
        ;;
    *)
        exec ${COMMAND} $@
        ;;
esac

