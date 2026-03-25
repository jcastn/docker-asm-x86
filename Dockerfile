# Utilisation d'Ubuntu en version Intel
FROM --platform=linux/amd64 ubuntu:latest

# Installation des outils de base
RUN apt-get update && apt-get install -y \
    nasm \
    binutils \
    gcc \
    gdb \
    make \
    vim \
    nano \
    strace \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app




