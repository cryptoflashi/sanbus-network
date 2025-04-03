# Usa una imagen ligera
FROM ubuntu:22.04

# Instala dependencias básicas
RUN apt-get update && apt-get install -y curl jq

# Copia el binario
COPY polygon-edge /usr/local/bin/polygon-edge

# Copia tus archivos de red
COPY . /app
WORKDIR /app

# Ejecuta el nodo
CMD ["polygon-edge", "server", "--data-dir", "./node-data", "--chain", "./genesis.json", "--libp2p", "0.0.0.0:1478", "--jsonrpc", "0.0.0.0:8545", "--grpc", "0.0.0.0:9632", "--seal"]
