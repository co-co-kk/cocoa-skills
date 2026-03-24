#!/usr/bin/env bash

set -euo pipefail

# 说明：该脚本预留为 Claude Code 全局安装入口。
# 第一阶段仅保留职责骨架，后续再补充目标目录探测、复制策略和覆盖规则。

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

main() {
  echo "[todo] 安装 skills/ 与 commands/ 到 Claude Code 全局目录"
  echo "仓库根目录: ${REPO_ROOT}"
}

main "$@"
