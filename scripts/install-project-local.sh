#!/usr/bin/env bash

set -euo pipefail

# 说明：该脚本预留为项目本地安装入口。
# 第一阶段仅保留职责骨架，后续再补充目标项目路径、复制范围和增量更新策略。

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
TARGET_PROJECT_DIR="${1:-}"

main() {
  if [[ -z "${TARGET_PROJECT_DIR}" ]]; then
    echo "用法: ./scripts/install-project-local.sh <目标项目目录>"
    exit 1
  fi

  echo "[todo] 安装 skills/ 与 commands/ 到指定项目目录"
  echo "仓库根目录: ${REPO_ROOT}"
  echo "目标项目目录: ${TARGET_PROJECT_DIR}"
}

main "$@"
