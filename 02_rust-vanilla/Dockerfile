FROM base-rust-server:latest

ENV RUST_SERVER_PORT=9301
ENV RUST_SERVER_RCON_PORT=9302
ENV RUST_SCRIPTS_DIR=$RUST_USER_DIR/scripts

EXPOSE $RUST_SERVER_PORT/udp
EXPOSE $RUST_SERVER_RCON_PORT/tcp

COPY --chown=serveradmin:serveradmin ./scripts/ ${RUST_SCRIPTS_DIR}
WORKDIR $RUST_SCRIPTS_DIR
RUN find . -iname "*.sh" -exec bash -c 'chmod +x "$0"' {} \;

WORKDIR $RUST_SERVER_DIR


USER root
WORKDIR /
RUN yum -y install hg
RUN hg clone https://hg.libsdl.org/SDL SDL && \
    cd SDL && \
    mkdir build && \
    cd build && \
    ../configure && \
    make && \
    sudo make install && \
    cd ../.. && \
    rm -rf SDL

RUN ls -la

RUN yum -y install \
    SDL.x86_64 \
    SDL-devel.x86_64

RUN yum -y install dnf-plugins-core
RUN yum config-manager --set-enabled powertools
# RUN dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
# RUN dnf config-manager --set-enabled PowerTools
RUN yum update

WORKDIR $RUST_SERVER_DIR
USER serveradmin


# Prepare server: generate map by seed (from .env file), add admins
RUN ${RUST_SCRIPTS_DIR}/entrypoint.sh --prepare-server

ENTRYPOINT [ "bash", "~/scripts/entrypoint.sh" ]
