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

# river/dam 使用的本地脚本（dam 本体是二进制，不入库，需另行安装）
LOCAL_BIN_SCRIPTS=(dam-status dam-bt dam-media ime-run river-helpers)

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

# 本地脚本：dam 状态栏及其点击菜单、river 的输入法与按键辅助
link_file() {
    local src="$1" dst="$2"
    [ -f "$src" ] || {
        echo "⚠️  源文件不存在: $src" >&2
        return 0
    }
    if [ -L "$dst" ]; then
        if [ "$(readlink "$dst")" = "$src" ]; then
            echo "跳过（已正确链接）: $dst"
        else
            rm "$dst"
            ln -s "$src" "$dst"
            echo "已修正: $dst -> $src"
        fi
    elif [ -e "$dst" ]; then
        if cmp -s "$src" "$dst"; then
            rm "$dst"
            ln -s "$src" "$dst"
            echo "已替换为链接（内容一致）: $dst -> $src"
        else
            echo "⚠️  $dst 已存在且内容不同，跳过，请手动处理" >&2
        fi
    else
        ln -s "$src" "$dst"
        echo "已链接: $dst -> $src"
    fi
}

mkdir -p "$HOME/.local/bin"
for name in "${LOCAL_BIN_SCRIPTS[@]}"; do
    link_file "$REPO_DIR/local/bin/$name" "$HOME/.local/bin/$name"
done

# 壁纸：链到 ~/Pictures/walls（shared 子模块内）
link_dir "$REPO_DIR/shared/walls" "$HOME/Pictures/walls"

# bat 自定义主题（vault）需要构建缓存到 ~/.cache/bat，否则 --theme 不生效
if command -v bat >/dev/null 2>&1 && [ -d "$REPO_DIR/shared/bat/themes" ]; then
    bat cache --build >/dev/null 2>&1 || true
fi

echo "完成。"
