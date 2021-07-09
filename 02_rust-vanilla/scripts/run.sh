#!/bin/bash

printenv
# Server run command
RUN_CMD="./RustDedicated"

RUN_CMD="${RUN_CMD} -batchmode"
RUN_CMD="${RUN_CMD} -nographics"
RUN_CMD="${RUN_CMD} -logfile \"${RUST_SERVER_LOGS_DIR}/${RUST_SERVER_LOGS_FILENAME}\""

RUN_CMD="${RUN_CMD} +server.ip \"${RUST_SERVER_IP}\""
RUN_CMD="${RUN_CMD} +server.port \"${RUST_SERVER_PORT}\""
RUN_CMD="${RUN_CMD} +server.tickrate \"${RUST_TICKRATE}\""
RUN_CMD="${RUN_CMD} +server.saveinterval \"${RUST_SAVE_INTERVAL}\""
RUN_CMD="${RUN_CMD} +server.identity \"${RUST_SERVER_IDENTITY}\""
RUN_CMD="${RUN_CMD} +server.hostname \"${RUST_SERVER_HOSTNAME}\""
RUN_CMD="${RUN_CMD} +server.seed \"${RUST_SERVER_SEED}\""
RUN_CMD="${RUN_CMD} +server.maxplayers \"${RUST_SERVER_MAXPLAYERS}\""
RUN_CMD="${RUN_CMD} +server.worldsize \"${RUST_SERVER_WORLDSIZE}\""
RUN_CMD="${RUN_CMD} +rcon.ip \"${RUST_RCON_IP}\""
RUN_CMD="${RUN_CMD} +rcon.port \"${RUST_SERVER_RCON_PORT}\""
RUN_CMD="${RUN_CMD} +rcon.web \"${RUST_RCON_WEB_ENABLE}\""
RUN_CMD="${RUN_CMD} +rcon.password \"${RUST_RCON_PASS}\""

echo "Starting Rust server..."
echo $RUN_CMD
# ls -la
# # Catch Ctrl+C
# NSTOP="0"
# stop_server() {
#     NSTOP="1"
#     echo "Stopping server..."
# }
# trap 'stop_server' SIGINT

# while :
# do
#     # # Save and clear logs file
#     # if [ -f "/home/steam/rust/gamelog.txt" ]; then
#     #     LFNAME="${SERVER_HOST_IP}-${SERVER_HOST_PORT}-$(date '+%FT%T').txt"
#     #     LFNAME=`echo "$LFNAME" | sed "s/-/_/g"`
#     #     LFNAME=`echo "$LFNAME" | sed "s/:/_/g"`
#     #     cat /home/steam/rust/gamelog.txt > /home/steam/rust/logs/$LFNAME
#     #     echo "" > /home/steam/rust/gamelog.txt
#     # fi

#     # Start server
#     bash $RUN_CMD

#     # Break loop
#     if [ "${NSTOP}" == "1" ]; then
#         break
#     fi
# done

# echo "Server is stopped!"
