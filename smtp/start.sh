#!/bin/sh

postmap /etc/postfix/vmailbox
resolvconf=/var/spool/postfix/etc/resolv.conf
rm -rf $resolvconf
cp /etc/resolv.conf $resolvconf
/usr/sbin/postfix start-fg
