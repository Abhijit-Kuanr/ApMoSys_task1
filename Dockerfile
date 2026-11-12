FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    nano \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root

# Copies the entire contents of the build context (freestyle_test) into /root/freestyle_test
COPY . /root/freestyle_test

CMD ["/bin/bash"]
