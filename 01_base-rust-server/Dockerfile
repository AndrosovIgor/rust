FROM ubuntu:20.04 as BaseImage

# Install system packages
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get -y install \
    software-properties-common \
    lib32stdc++6 \
    lib32gcc1 \
    ca-certificates \
    sudo
RUN apt-get -y install \
    wget \
    curl \
    tar \
    grep \
    sed \
    git \
    jq \
    unzip
RUN apt-get -y install \
    zlib1g \
    rsync \
    gcc \
    gnupg \
    make \
    file

RUN add-apt-repository multiverse
RUN apt-get update
RUN apt-get -y upgrade

ARG RUST_USER_AND_GROUP_NAME=serveradmin
ARG RUST_USER_AND_GROUP_ID=1000
ARG RUST_STEAM_LOGIN=anonymous
ARG RUST_STEAM_APP_ID=258550

ENV RUST_USER_DIR=/home/${RUST_USER_AND_GROUP_NAME}
ENV RUST_STEAM_DIR=${RUST_USER_DIR}/steamcmd
ENV RUST_SERVER_DIR=${RUST_USER_DIR}/rustserver

# Create server user
RUN groupadd \
        --gid $RUST_USER_AND_GROUP_ID \
        --system $RUST_USER_AND_GROUP_NAME && \
    useradd \
        --uid $RUST_USER_AND_GROUP_ID \
        --system \
        --create-home \
        --gid $RUST_USER_AND_GROUP_NAME $RUST_USER_AND_GROUP_NAME

WORKDIR $RUST_USER_DIR

# Create rust server folder
RUN mkdir -p $RUST_STEAM_DIR
RUN mkdir -p $RUST_SERVER_DIR

FROM BaseImage as SteamCMDImage
# Install SteamCMD
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar -zxvf - -C ${RUST_STEAM_DIR}

FROM SteamCMDImage as VanillaRust
# Install rust dedicated server
RUN bash ${RUST_STEAM_DIR}/steamcmd.sh \
    +login $RUST_STEAM_LOGIN \
    +force_install_dir $RUST_SERVER_DIR \
    +app_update $RUST_STEAM_APP_ID \
    validate \
    +quit













# # Install SteamCMD
# RUN apt-get -y install lib32gcc1
# RUN apt-get -y install steam
# RUN apt-get -y install steamcmd




# ENV DEBIAN_FRONTEND=noninteractive


# ARG STEAM_LOGIN=anonymous
# ARG STEAM_APP_ID=258550

# ENV RUST_USER_DIR=/home/serveradmin

# ENV RUST_SERVER_DIR=$RUST_USER_DIR/rustserver
# ENV RUST_SERVER_LOGS_DIR=$RUST_USER_DIR/logs
# ENV RUST_SERVER_LOGS_FILENAME=server.log

# # Install system packages
# RUN apt-get update
# RUN apt-get -y install apt-utils
# RUN apt-get -y upgrade

# RUN add-apt-repository multiverse
# RUN apt-get update

# RUN apt-get -y install \
#     sudo \
#     make \
#     gnupg \
#     ca-certificates \
#     bash \
#     file \
#     wget \
#     curl \
#     tar \
#     grep \
#     sed \
#     git \
#     jq \
#     unzip \
#     zlib1g \
#     rsync \
#     gcc \
#     python3 \
#     gnupg \
#     lib32gcc1 \
#     software-properties-common

# # openssh \
# # hg \
# # glibc \
# # libgcc \
# # glibc \
# # libstdc++ \

# # # Install SDL2
# # RUN hg clone https://hg.libsdl.org/SDL SDL && \
# #     cd SDL && \
# #     mkdir build && \
# #     cd build && \
# #     ../configure && \
# #     make && \
# #     sudo make install && \
# #     cd ../.. && \
# #     rm -rf SDL

# # Install MONO
# RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
# RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
# RUN apt-get update
# RUN apt-get -y install mono-devel

# # Switch user
# USER serveradmin
# WORKDIR $RUST_USER_DIR

# # Install SteamCMD
# RUN apt-get -y install steamcmd 


# # WORKDIR $RUST_USER_DIR



# # # Create rust server folder
# # RUN mkdir -p $RUST_SERVER_DIR
# # RUN mkdir -p $RUST_SERVER_LOGS_DIR

# # # Install rust dedicated server
# # RUN bash ${RUST_STEAM_DIR}/steamcmd.sh \
# #     +login $STEAM_LOGIN \
# #     +force_install_dir $RUST_SERVER_DIR \
# #     +app_update $STEAM_APP_ID \
# #     validate \
# #     +quit

