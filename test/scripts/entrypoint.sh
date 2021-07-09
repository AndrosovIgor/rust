#!/bit/bash

umod new launcher \
    +server.maxplayers 50 \
    +server.worldsize 1000 \
    +server.seed 9674020 \
    +server.hostname "PrivatePVPServer" \
    +server.identity "private_pvp_server" \
    +server.ip 0.0.0.0 \
    +server.port 28015 \
    +server.tickrate 10 \
    +server.saveinterval 500 \
    +rcon.ip 0.0.0.0 \
    +rcon.port 28016 \
    +rcon.web 0 \
    +rcon.password "sajj354gjsn33_nfdlsn1314" \
    -logfile gamelog.txt

umod launch