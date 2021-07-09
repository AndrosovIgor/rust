#!/bin/bash

# Export configuration EnvVars from '.env' file
set -o allexport && \
eval $(grep -v '^#' ${RUST_SCRIPTS_DIR}/.env | sed 's/^/export /') && \
set +o allexport


for i in "$@"
do
case $i in
    --prepare-server)
    IS_PREPARING=1
    shift # past argument=value
    ;;
    --default)
    DEFAULT=YES
    shift # past argument with no value
    ;;
    *)
          # unknown option
    ;;
esac
done

echo NEED_PREPARE: 

if [ $IS_PREPARING -eq 1 ]
then
    echo "Start preparing RUST server...."
    #${RUST_SCRIPTS_DIR}/prepare.sh
    #echo $?
fi
