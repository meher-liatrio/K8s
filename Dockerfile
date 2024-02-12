# FROM ubuntu:22.04
FROM --platform=linux/amd64 ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y  && \
apt-get install curl -y && \
apt-get install jq -y && \
apt-get install bash -y && \
apt-get install sudo -y && \
apt-get install git -y && \
useradd -ms /bin/bash GHA && usermod -aG sudo GHA && \
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
WORKDIR /home/GHA
COPY start.sh /home/GHA/
RUN chown GHA:GHA start.sh && \
chmod u+x start.sh
USER GHA
RUN curl -o actions-runner-linux-x64-2.312.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.312.0/actions-runner-linux-x64-2.312.0.tar.gz && \
    echo "85c1bbd104d539f666a89edef70a18db2596df374a1b51670f2af1578ecbe031  actions-runner-linux-x64-2.312.0.tar.gz" | shasum -a 256 -c && \
    tar xzf ./actions-runner-linux-x64-2.312.0.tar.gz && \
    sudo ./bin/installdependencies.sh
ENTRYPOINT [ "./start.sh" ]
