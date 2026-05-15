#!/usr/bin/env bash

set -e

echo "即将执行一键卸载"
echo "默认会自动删除服务器端节点和订阅配置"
echo "客户端内已导入的节点和订阅仍需手动删除"

wget -P /root -N --no-check-certificate "https://raw.githubusercontent.com/wbowen123/v2ray-agent/master/install.sh"
chmod 700 /root/install.sh
printf '20\ny\n' | /root/install.sh
