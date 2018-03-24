#!/bin/bash -e

COMMAND=$1; shift
case ${COMMAND} in
    init | initdb | postgres)
        if [ ! -d ${PGDATA} ]; then
            if [ -z "${INITDB_OPTIONS}" ]; then
                if [ -t 0 ]; then
                    INITDB_OPTIONS="--auth md5 --pwprompt"
                else
                    INITDB_OPTIONS="--auth md5 --pwfile=${INITDB_PWFILE:-/dev/shm/initdb_password}"
                fi

                if [ -n "${PGUSER}" -a "${PGUSER}" != "postgres" ]; then
                    INITDB_OPTIONS="--username ${PGUSER} ${INITDB_OPTIONS}"
                fi
            fi

            echo "ANDAHME Initializing Database - INITDB_OPTIONS (${INITDB_OPTIONS})"
            echo """${INITDB_PASSWORD:-2345}""" > /dev/shm/initdb_password
            initdb ${INITDB_OPTIONS}
            rm -f /dev/shm/initdb_password

            if [ -n "${PGDATABASE}" -a "${PGDATABASE}" != "postgres" ]; then
                echo "ANDAHME Applying Configuration - PGDATABASE (${PGDATABASE})"
                postgres --single template0 -F -c exit_on_error=true > /dev/null <<-EOF
					ALTER DATABASE postgres RENAME TO ${PGDATABASE};
					EOF
            fi
        fi
        ;;&
    init | initsql | postgres)
        shopt -s nullglob
        for DOCKER_INIT_SQL in /sql/*.sql; do
            echo "ANDAHME Applying SQL (${DOCKER_INIT_SQL})"
            postgres --single ${PGDATABASE:-postgres} -c exit_on_error=true -j >> ${PGDATA}/sql.log < ${DOCKER_INIT_SQL}
        done
        shopt -u nullglob
        ;;&
    init | initdb | initsql)
        if [ -t 0 ]; then
            echo "ANDAHME Tips - Get moving quickly with native tools"
            echo
            echo "    pg_ctl start                     (background)"
            echo "      or"
            echo "    postgres                         (foreground)"
            echo
        fi
        ;;
    noinit | postgres)
        if [ -t 0 ]; then
            echo "ANDAHME Tips - Getting outta here"
            echo
            echo "    ctrl-c                           (request shutdown)"
            echo "      or"
            echo "    ctrl-p ctrl-q                    (disconnect from container)"
            echo
        fi

        exec postgres
        ;;
    bash)
        echo
        echo " ANDAHME - Bootstrap Tools"
        echo
        echo "    /docker-entrypoint.sh initdb"
        echo "    /docker-entrypoint.sh initsql"
        echo "    /docker-entrypoint.sh init       (initdb + initsql)"
        echo
        echo "    /docker-entrypoint.sh postgres   (initdb + initsql + postgres)"
        echo
        echo "    /docker-entrypoint.sh noinit     (only postgres)"
        echo
        echo
        echo " ANDAHME - Environment"
        echo
        echo "    PGHOST                           (${PGHOST})"
        echo "    PGDATABASE                       (${PGDATABASE:-default: postgres})"
        echo "    PGUSER                           (${PGUSER:-default: postgres})"
        echo
        echo
        ;;&
    *)
        exec ${COMMAND} $@
        ;;
esac

