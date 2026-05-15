#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
LOCAL_INSTALL_SH="${SCRIPT_DIR}/install.sh"
SYSTEM_INSTALL_SH="/etc/v2ray-agent/install.sh"

if [[ "${EUID}" -ne 0 ]]; then
    echo "请使用 root 运行卸载脚本"
    echo "示例: sudo bash ${0}"
    exit 1
fi

TARGET_INSTALL_SH=""
if [[ -f "${LOCAL_INSTALL_SH}" ]]; then
    TARGET_INSTALL_SH="${LOCAL_INSTALL_SH}"
elif [[ -f "${SYSTEM_INSTALL_SH}" ]]; then
    TARGET_INSTALL_SH="${SYSTEM_INSTALL_SH}"
else
    echo "未找到 install.sh，无法继续卸载"
    exit 1
fi

echo "即将调用 ${TARGET_INSTALL_SH} 执行一键卸载..."
echo "说明: 将自动选择菜单 20，并自动确认卸载。"

printf '20\ny\n' | bash "${TARGET_INSTALL_SH}"
