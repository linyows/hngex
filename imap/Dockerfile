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
  dovecot-core \
  dovecot-imapd \
  dovecot-lmtpd \
  dovecot-mysql \
  dovecot-submissiond \
  ca-certificates \
  ssl-cert && \
  groupadd -g 1000 vmail && \
  useradd -u 1000 -g 1000 vmail && \
  passwd -l vmail && \
  mkdir /home/vmail && \
  chown vmail:vmail /home/vmail && \
  chmod o+w /home/vmail && \
  chmod +x /sbin/tini && \
  make-ssl-cert generate-default-snakeoil

EXPOSE 993 24 2525
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/usr/sbin/dovecot", "-F"]
