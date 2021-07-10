FROM alpine:latest

ARG FRP_VERSION=0.37.0
ARG FRP_PLATFORM=linux_amd64
ARG FRP_DOWNLOAD=https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_${FRP_PLATFORM}.tar.gz

ADD ${FRP_DOWNLOAD} /tmp/frp.tar.gz

RUN mkdir -p /usr/local/bin && \
    mkdir -p /tmp/frp && \
    tar -xzf /tmp/frp.tar.gz -C /tmp/frp --strip-components=1 && \
    cp /tmp/frp/frps /usr/local/bin/frps && \
    cp /tmp/frp/frpc /usr/local/bin/frpc && \
    chmod +x /usr/local/bin/frps /usr/local/bin/frpc && \
    rm -rf /tmp/frp*

ENV PATH=${PATH}:/usr/local/bin
