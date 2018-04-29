#!/bin/bash

resolve() {
    #
    # Check variable is set, exit with error if not, otherwise return value.
    # Params:
    # 1: string name of variable to check.
    # return: value of named variable
    # usage: NEWVAR=$(resolve VARNAME)
    #
    local CHECK=`echo $1`
    if [ -z ${!CHECK} ]; then echo "ERROR: env_var $CHECK value is required"; exit 1; fi

    echo ${!CHECK}
}

sed "s/\${PG_SERVICE_NAME}/$(resolve PG_SERVICE_NAME)/" /usr/local/src/ROOT.xml \
| sed "s/\${PG_SERVICE_PORT}/$(resolve PG_SERVICE_PORT)/" \
| sed "s/\${DATA_DB_USERNAME}/$(resolve DATA_DB_USERNAME)/" \
| sed "s/\${DATA_DB_PASSWORD}/$(resolve DATA_DB_PASSWORD)/" \
| sed "s/\${DATA_DB_NAME}/$(resolve DATA_DB_NAME)/" \
| sed "s/\${DATA_DB_MAX_TOTAL}/$(resolve DATA_DB_MAX_TOTAL)/" \
| sed "s/\${DATA_DB_MAX_IDLE}/$(resolve DATA_DB_MAX_IDLE)/" \
| sed "s/\${DATA_DB_MAX_WAIT}/$(resolve DATA_DB_MAX_WAIT)/" \
> /opt/webserver/conf/Catalina/localhost/ROOT.xml

