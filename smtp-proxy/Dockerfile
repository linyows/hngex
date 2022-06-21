FROM ubuntu:jammy

ENV TINI_VERSION=v0.19.0 \
    TINI_SUFFIX= \
    WARP_VERSION=v0.5.1 \
    ARCH=x86_64
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini${TINI_SUFFIX} /sbin/tini
ADD https://github.com/linyows/warp/releases/download/${WARP_VERSION}/warp_linux_${ARCH}.tar.gz /warp.tar.gz
RUN tar -zxvf warp.tar.gz && mv warp /sbin/warp && rm /warp.tar.gz

RUN apt-get -y update && apt-get -y install \
  net-tools \
  telnet \
  netcat \
  vim && \
  chmod +x /sbin/tini

EXPOSE 25
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/sbin/warp", "-ip", "0.0.0.0", "-port", "10025"]
