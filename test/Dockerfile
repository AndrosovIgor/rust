FROM mcr.microsoft.com/dotnet/sdk:5.0-focal

ENV RUST_USER_DIR=/root
ENV RUST_SERVER_DIR=${RUST_USER_DIR}/server

ENV PATH=$PATH:${RUST_USER_DIR}/.dotnet/tools

RUN dotnet nuget add source https://www.myget.org/f/umod/api/v3/index.json --name uMod
RUN dotnet tool install -g uMod --version "*-*"
RUN dotnet new -i "uMod.Templates::*-*"

WORKDIR ${RUST_SERVER_DIR}

RUN umod install Rust --dir=${RUST_SERVER_DIR}

COPY ./scripts/entrypoint.sh ${RUST_SERVER_DIR}/entrypoint.sh

ENTRYPOINT [ "bash", "entrypoint.sh" ]