FROM ubuntu:22.04

RUN apt update && \
    apt install -y curl unzip git wget build-essential && \
    apt install -y golang

# Instala Polygon Edge
RUN git clone https://github.com/0xPolygon/polygon-edge.git && \
    cd polygon-edge && make build

WORKDIR /app
COPY . /app

# Expone los puertos necesarios
EXPOSE 8545
EXPOSE 1478
EXPOSE 9632

CMD ["../polygon-edge/build/polygon-edge", "server", \
     "--data-dir", "./node-data", \
     "--chain", "./genesis.json", \
     "--libp2p", "0.0.0.0:1478", \
     "--jsonrpc", "0.0.0.0:8545", \
     "--grpc", "0.0.0.0:9632", \
     "--seal"]
