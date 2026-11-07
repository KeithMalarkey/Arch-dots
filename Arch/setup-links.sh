#!/usr/bin/env bash
# 新机器部署：clone 本仓库（含 shared 子模块）后运行本脚本，
# 自动重建 ~/.config 下的软链接，并把壁纸链到 ~/Pictures/walls。
# 用法: git clone --recurse-submodules <Arch-dots> && bash Arch/setup-links.sh
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

# Arch 专属配置（本仓库内）
ARCH_CONFIGS=(foot fuzzel hypr mako niri river)

# 与 NixOS 共享的配置（shared 子模块内）
SHARED_CONFIGS=(bat fastfetch kitty noctalia nvim tmux)

link_dir() {
    local src="$1" dst="$2"
    if [ -L "$dst" ]; then
        if [ "$(readlink "$dst")" = "$src" ]; then
            echo "跳过（已正确链接）: $dst"
        else
            rm "$dst"
            ln -s "$src" "$dst"
            echo "已修正: $dst -> $src"
        fi
    elif [ -e "$dst" ]; then
        echo "⚠️  $dst 已存在且不是软链接，跳过，请手动处理" >&2
    else
        ln -s "$src" "$dst"
        echo "已链接: $dst -> $src"
    fi
}

mkdir -p "$CONFIG_DIR"
for name in "${ARCH_CONFIGS[@]}"; do
    link_dir "$REPO_DIR/$name" "$CONFIG_DIR/$name"
done
for name in "${SHARED_CONFIGS[@]}"; do
    link_dir "$REPO_DIR/shared/$name" "$CONFIG_DIR/$name"
done

# 壁纸：链到 ~/Pictures/walls（shared 子模块内）
link_dir "$REPO_DIR/shared/walls" "$HOME/Pictures/walls"

echo "完成。"
