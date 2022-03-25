FROM ubuntu:jammy

ARG DEBIAN_FRONTEND=noninteractive
ENV TINI_VERSION=v0.19.0 \
    TINI_SUFFIX=
#ENV TINI_VERSION=v0.19.0 \
#    TINI_SUFFIX=-arm64
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini${TINI_SUFFIX} /sbin/tini

RUN apt-get -y update && apt-get -y install \
  net-tools \
  telnet \
  netcat \
  postfix && \
  chmod +x /sbin/tini

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 25 465
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/start.sh"]
