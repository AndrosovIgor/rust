FROM base-rust-server:latest

ARG RUST_SERVER_OXIDE_INIT_DIR=$RUST_USER_DIR/RustDedicated_Data
ARG RUST_SERVER_OXIDE_DIR=$RUST_SERVER_DIR/RustDedicated_Data

WORKDIR $RUST_USER_DIR

RUN curl -sSL "https://umod.org/games/rust/download/develop" > oxide.zip
RUN unzip -o -q oxide.zip && \
    rm oxide.zip

RUN rsync -r $RUST_SERVER_OXIDE_INIT_DIR/* $RUST_SERVER_OXIDE_DIR
RUN rm -r $RUST_SERVER_OXIDE_INIT_DIR

WORKDIR $RUST_SERVER_DIR