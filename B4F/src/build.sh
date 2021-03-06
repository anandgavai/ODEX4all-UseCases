#!/bin/bash -x

PORT=1111
USER=dba
PASS=dba
LOG_FILE=$0.log
SQL_FILES=(install_vad_pkgs.sql import_data.sql post_install_fct.sql)

rm -f $LOG_FILE
for fname in ${SQL_FILES[@]}
do
    echo "### START [$(date)]: 'isql ... $fname'" >> $LOG_FILE
    isql $PORT $USER $PASS verbose=off errors=stdout $fname >> $LOG_FILE
    echo "### END [$(date)]" >> $LOG_FILE
done
