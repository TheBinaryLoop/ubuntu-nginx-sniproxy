#!/bin/sh
set -e

sed -i "s/UPSTREAM_DNS/${UPSTREAM_DNS}/"    /etc/sniproxy.conf