#!/usr/bin/env bash

set -e

wget -P /root -N --no-check-certificate "https://raw.githubusercontent.com/wbowen123/v2ray-agent-/master/install.sh"
chmod 700 /root/install.sh
/root/install.sh
