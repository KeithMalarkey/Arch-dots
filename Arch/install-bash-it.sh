#!/usr/bin/env bash
# 安装/更新 bash-it（固定到已知可用的 commit），再恢复自定义 alias 与启用项。
# 上游仓库不进本仓库，只保存 overlay（bash_it/）。
# 用法: bash Arch/install-bash-it.sh
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASH_IT_DIR="${BASH_IT:-$HOME/.bash_it}"
BASH_IT_REMOTE="${BASH_IT_REMOTE:-https://github.com/Bash-it/bash-it.git}"
BASH_IT_PIN="${BASH_IT_PIN:-72ea9e285fe1828977d1cd2bc596b901bcc57440}"

if [ -L "$BASH_IT_DIR" ]; then
    echo "⚠️  $BASH_IT_DIR 是软链接；请先把它换成真实目录再运行本脚本" >&2
    exit 1
fi

if [ ! -d "$BASH_IT_DIR/.git" ]; then
    if [ -e "$BASH_IT_DIR" ]; then
        echo "⚠️  $BASH_IT_DIR 已存在且不是 git 仓库，请手动处理" >&2
        exit 1
    fi
    git clone "$BASH_IT_REMOTE" "$BASH_IT_DIR"
elif ! git -C "$BASH_IT_DIR" cat-file -e "${BASH_IT_PIN}^{commit}" 2>/dev/null; then
    # 本地还没有目标 commit 时才联网；已有则允许离线运行
    git -C "$BASH_IT_DIR" fetch origin
fi

# 固定版本，避免上游更新把 prompt/alias 行为改掉
git -C "$BASH_IT_DIR" checkout --quiet "$BASH_IT_PIN"

# 恢复自定义 alias（该文件在上游被 .gitignore 忽略，不会与 checkout 冲突）
install -Dm644 "$REPO_DIR/bash_it/aliases/custom.aliases.bash" \
    "$BASH_IT_DIR/aliases/custom.aliases.bash"

# 恢复启用项；bash-it 的 enable 是幂等的
BASH_IT="$BASH_IT_DIR" bash --noprofile --norc -c '
    source "$BASH_IT/bash_it.sh" >/dev/null 2>&1
    bash-it enable alias bash-it directory editor general
    bash-it enable plugin base git history history-search url zoxide fzf
    bash-it enable completion system bash-it aliases
'

echo "bash-it 已就绪：$BASH_IT_DIR (${BASH_IT_PIN:0:12})"
echo "重新登录，或执行: exec bash -l"
