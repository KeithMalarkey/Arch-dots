#!/usr/bin/env bash
# 新机器部署：clone 本仓库后运行本脚本，自动重建 ~/.config 下的软链接。
# 用法: bash setup-links.sh   （在仓库根目录运行即可，位置不限）
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

# 仓库中需要链入 ~/.config 的目录，以后新增配置就往这个列表里加名字
CONFIGS=(bat fastfetch foot fuzzel hypr kitty mako niri noctalia nvim river tmux)

mkdir -p "$CONFIG_DIR"
for name in "${CONFIGS[@]}"; do
    src="$REPO_DIR/$name"
    dst="$CONFIG_DIR/$name"
    if [ -L "$dst" ]; then
        echo "跳过（已是软链接）: $dst"
    elif [ -e "$dst" ]; then
        echo "⚠️  $dst 已存在且不是软链接，跳过，请手动处理" >&2
    else
        ln -s "$src" "$dst"
        echo "已链接: $dst -> $src"
    fi
done
echo "完成。"
