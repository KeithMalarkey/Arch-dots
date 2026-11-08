<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [P0. Preface](#p0-preface)
- [P1. Arch Linux Installation](#p1-arch-linux-installation)
  - [I. Prerequisites](#i-prerequisites)
    - [1.1 USB Drive](#11-usb-drive)
    - [1.2 ISO Image](#12-iso-image)
    - [1.3 PC Requirements](#13-pc-requirements)
  - [II. Manual Steps](#ii-manual-steps)
    - [2.1 Clock Synchronization and Image Verification](#21-clock-synchronization-and-image-verification)
    - [2.2 Network](#22-network)
      - [2.2.1 Wi-Fi](#221-wi-fi)
      - [2.2.2 Ethernet](#222-ethernet)
    - [2.3 Disk Partitioning](#23-disk-partitioning)
      - [2.3.1 Planning](#231-planning)
      - [2.3.2 Operations](#232-operations)
        - [2.3.2.1 Creating Partitions](#2321-creating-partitions)
        - [2.3.2.2 Formatting Partitions](#2322-formatting-partitions)
        - [2.3.2.3 Mounting Partitions](#2323-mounting-partitions)
      - [2.3.3 Verifying the Partition Layout](#233-verifying-the-partition-layout)
    - [2.4 Linux Base](#24-linux-base)
      - [2.4.1 Switching pacman Mirrors](#241-switching-pacman-mirrors)
      - [2.4.2 Installing the Linux Kernel and Firmware](#242-installing-the-linux-kernel-and-firmware)
    - [2.5 Basic Configuration](#25-basic-configuration)
      - [2.5.1 Base Configuration and Installation](#251-base-configuration-and-installation)
      - [2.5.2 Installing GRUB](#252-installing-grub)
      - [2.5.3 Network Tools](#253-network-tools)
    - [2.6 User-Space Setup](#26-user-space-setup)
      - [2.6.1 Wi-Fi Connection](#261-wi-fi-connection)
      - [2.6.2 Creating a User](#262-creating-a-user)
      - [2.6.3 Desktop and Common Configuration](#263-desktop-and-common-configuration)
        - [2.6.3.1 Additional Packages and Startup](#2631-additional-packages-and-startup)
        - [2.6.3.2 Terminal](#2632-terminal)
        - [2.6.3.3 Window Manager](#2633-window-manager)
        - [2.6.3.4 Display Manager](#2634-display-manager)
        - [2.6.3.5 Browser](#2635-browser)
        - [2.6.3.6 Font Management](#2636-font-management)
        - [2.6.3.7 File Management](#2637-file-management)
        - [2.6.3.8 Audio, Video, Clipboard, Drawing, and More](#2638-audio-video-clipboard-drawing-and-more)
        - [2.6.3.9 Version Control](#2639-version-control)
        - [2.6.3.10 Package Managers and Build Tools](#26310-package-managers-and-build-tools)
        - [2.6.3.11 Noctalia Desktop](#26311-noctalia-desktop)
        - [2.6.3.12 Agents](#26312-agents)
        - [2.6.3.13 Misc](#26313-misc)
    - [2.7 Dual-Boot Notes](#27-dual-boot-notes)
      - [2.7.1 Disable Windows Fast Startup and Hibernation](#271-disable-windows-fast-startup-and-hibernation)
      - [2.7.2 Habits When Switching from Windows to Linux](#272-habits-when-switching-from-windows-to-linux)
      - [2.7.3 ESP and Boot](#273-esp-and-boot)
      - [2.7.4 Time](#274-time)
      - [2.7.5 Recheck After Windows Updates](#275-recheck-after-windows-updates)
      - [2.7.6 Quick Troubleshooting](#276-quick-troubleshooting)
  - [III. Agentic Install](#iii-agentic-install)
    - [3.1 Role Boundaries](#31-role-boundaries)
    - [3.2 Prerequisite: Live Environment (Manual)](#32-prerequisite-live-environment-manual)
      - [3.2.1 Network](#321-network)
      - [3.2.2 Time Synchronization](#322-time-synchronization)
      - [3.2.3 Install and Start SSH](#323-install-and-start-ssh)
      - [3.2.4 Authentication](#324-authentication)
      - [3.2.5 Get the IP and Verify the Host Key](#325-get-the-ip-and-verify-the-host-key)
      - [3.2.6 Start tmux](#326-start-tmux)
    - [3.3 How the Agent Connects](#33-how-the-agent-connects)
    - [3.4 Staged Execution](#34-staged-execution)
      - [Phase 0: Read-Only Discovery](#phase-0-read-only-discovery)
      - [Phase 1: Generate an Installation Plan](#phase-1-generate-an-installation-plan)
      - [Phase 2: Partitioning and Formatting](#phase-2-partitioning-and-formatting)
      - [Phase 3: Install the Base System](#phase-3-install-the-base-system)
      - [Phase 4: chroot Configuration](#phase-4-chroot-configuration)
      - [Phase 5: Pre-Reboot Verification](#phase-5-pre-reboot-verification)
      - [Phase 6: Post-Install Verification](#phase-6-post-install-verification)
    - [3.5 Agent Ground Rules](#35-agent-ground-rules)
    - [3.6 Suggested Script Layout](#36-suggested-script-layout)
    - [3.7 Optional: Declarative Install](#37-optional-declarative-install)
    - [3.8 Common Pitfalls](#38-common-pitfalls)
    - [3.9 Minimal Acceptance Checklist](#39-minimal-acceptance-checklist)
- [P2. Linux Selection](#p2-linux-selection)
  - [I. Conclusion First](#i-conclusion-first)
  - [II. Beginner-Friendly](#ii-beginner-friendly)
    - [2.1 Linux Mint](#21-linux-mint)
    - [2.2 Ubuntu LTS](#22-ubuntu-lts)
    - [2.3 Fedora Workstation](#23-fedora-workstation)
    - [2.4 Pop!_OS](#24-pop_os)
    - [2.5 Debian Stable](#25-debian-stable)
    - [2.6 openSUSE Tumbleweed and Leap](#26-opensuse-tumbleweed-and-leap)
    - [2.7 Looks First: Zorin OS and elementary OS](#27-looks-first-zorin-os-and-elementary-os)
  - [III. Immutable and Atomic Updates](#iii-immutable-and-atomic-updates)
  - [IV. Arch Family: Want Arch Without a Manual Install](#iv-arch-family-want-arch-without-a-manual-install)
    - [4.1 EndeavourOS](#41-endeavouros)
    - [4.2 Manjaro](#42-manjaro)
    - [4.3 CachyOS](#43-cachyos)
    - [4.4 Arch and archinstall](#44-arch-and-archinstall)
  - [V. Advanced](#v-advanced)
    - [5.1 NixOS](#51-nixos)
    - [5.2 Gentoo](#52-gentoo)
    - [5.3 Void Linux](#53-void-linux)
    - [5.4 Alpine Linux (Awareness Only)](#54-alpine-linux-awareness-only)
    - [5.5 Slackware and LFS (Awareness Only)](#55-slackware-and-lfs-awareness-only)
  - [VI. How to Choose: By User Type](#vi-how-to-choose-by-user-type)
  - [VII. The Lowest Trial-and-Error Cost](#vii-the-lowest-trial-and-error-cost)
- [P3. Resources](#p3-resources)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

> This is the English version of this guide. The Chinese original is available at [README.zh-CN.md](./README.zh-CN.md).

# P0. Preface

This document is both a personal memo and a Unix-like guide. I hope it helps anyone who comes across it. Of course, if you choose `archinstall`, you can skip all of the manual work.

This guide also includes an Agentic Install tutorial. Given Arch's characteristics, if you want a fully controllable system with a high degree of freedom, an Arch-based distribution is one of your best choices.

> note: Arch Linux is not recommended for Linux beginners. It can feel like starting in hell mode and often involves repeated failures. A Debian-based system (Debian stable or Ubuntu) or openSUSE is a better starting point.

# P1. Arch Linux Installation

## I. Prerequisites

### 1.1 USB Drive

You need a Ventoy USB drive, which can hold multiple system images. Make sure the drive has enough capacity; 10 GB or more is usually sufficient.

> Alternative: If you do not have a Ventoy drive, a normal formatted USB drive also works, but it has three obvious drawbacks: (1) you may need to back up or migrate existing data before formatting; (2) the drive capacity is not fully utilized; (3) you need an additional ISO burning tool (e.g. Rufus) to write the image to the drive.

### 1.2 ISO Image

Use a relatively recent ISO image. This guide uses [V2026.10.01](https://mirrors.tuna.tsinghua.edu.cn/archlinux/iso/2026.10.01/archlinux-2026.10.01-x86_64.iso) as an example.

### 1.3 PC Requirements

For a first-time installer, I recommend practicing on an old laptop (e.g. a ThinkPad). Still, there are some basic requirements. My minimum recommended configuration is:

1. RAM: 4 GB
2. Storage: 50 GB
3. CPU: any `x86_64`-compatible CPU

## II. Manual Steps

### 2.1 Clock Synchronization and Image Verification

```bash
<!-- optional: verify the integrity of the downloaded Arch Linux image -->
gpg --verify archlinux-2026.10.01-x86_64.iso.sig archlinux-2026.10.01-x86_64.iso
timedatectl set-ntp true
```

### 2.2 Network

First, verify that the network works:

```bash
ping baidu.com -c 3
```

If packets are transmitted and latency is shown, the network is working.

#### 2.2.1 Wi-Fi

```bash
<!-- enable the radio of the network device -->
rfkill unblock wifi
<!-- list available WLAN interfaces -->
iwctl device list
<!-- assume the WLAN interface shown above is <wlan>; list available Wi-Fi networks -->
iwctl station <wlan> get-networks
<!-- connect to Wi-Fi; replace <SSID> and <wifi-passwd> with your actual values -->
iwctl station <wlan> connect <SSID> password <wifi-passwd>
```

#### 2.2.2 Ethernet

```bash
<!-- show Ethernet interfaces -->
ip link
pacman -S dhcpcd
<!-- connect Ethernet; assume the interface name is <e-name> -->
dhcpcd <e-name>
```

> Note: After setting up the network, verify connectivity again.

### 2.3 Disk Partitioning

#### 2.3.1 Planning

Before partitioning, plan the layout according to your hardware. Most layouts use three or four partitions; the sizes of the `efi` partition and the `swap` partition are relatively fixed.

+ Three-partition layout
  + `efi` partition
  + `swap` partition
  + root partition `/`

+ Four-partition layout
  + `efi` partition
  + `swap` partition
  + root partition `/`
  + home partition `/home`

An `efi` partition of around 500 MB is more than enough. If you have 16 GB of RAM, `swap` can be small (300–500 MB); otherwise, make it larger. For example, with only 4 GB of RAM, 1 GB of swap is recommended. With a three-partition layout, all remaining space goes to root. With four partitions, follow the rule that "`/home` usually needs more space than `/`": make root smaller and home larger.

**Planning examples**

**1. Three partitions (4 GB RAM / 51.5 GB storage)**

| Partition | Size | Purpose |
| :--- | :---: | :---: |
| /dev/target1p4 | 500M | `efi` partition |
| /dev/target1p5 | 1G | `swap` partition |
| /dev/target1p6 | 50G | `/` partition |

**2. Four partitions (64 GB RAM / 551 GB storage)**

| Partition | Size | Purpose |
| :--- | :---: | :---: |
| /dev/target1p4 | 500M | `efi` partition |
| /dev/target1p5 | 500M | `swap` partition |
| /dev/target1p6 | 50G | `/` partition |
| /dev/target2p3 | 500G | `/home` partition |

> note: For `/` and `/home`, you can follow the four-partition example. As a rule of thumb, make `/` at least 25 GB. The swap sizes above assume you do not use hibernation; if you do, swap should generally be larger than RAM.

#### 2.3.2 Operations

##### 2.3.2.1 Creating Partitions

```bash
<!-- list disks and choose the target disk -->
fdisk -l
<!-- clear the screen, or press ctrl + l -->
clear
```

Assume the target disk devices are `/dev/target1` and `/dev/target2`.

```bash
<!-- three-partition example -->
fdisk /dev/target1
<!-- assume the target partitions on target1 are partition4/5/6 (p4/5/6), -->
<!-- i.e. /dev/target1p4 /dev/target1p5 /dev/target1p6. Common operations: -->
<!-- ! These are common operations; use them as needed -->
<!-- show basic operations -->
m
<!-- delete a partition (dangerous; press q to exit without writing, do not press w) -->
d
<!-- create a new partition -->
n
<!-- print the partition table; do this after every change -->
p
<!-- create a new GPT partition table (dangerous; only if the whole disk is the target) -->
g
<!-- write the partition table to disk -->
w
```

Continue with the second disk:

```bash
<!-- four-partition example -->
fdisk /dev/target2
<!-- assume the target partition on target2 is partition3 (p3), i.e. /dev/target2p3 -->
<!-- perform the same operations as on target1 -->
```

> note: When entering a partition size, use `+<size>` whenever the prompt shows `sector` or `+`, for example `+100M` or `+1G`.

##### 2.3.2.2 Formatting Partitions

Three-partition layout:

```bash
mkfs.fat -F32 /dev/target1p4
mkswap /dev/target1p5
swapon /dev/target1p5

mkfs.btrfs -f /dev/target1p6
<!-- or ext4 -->
<!-- mkfs.ext4 -f /dev/target1p6 -->
```

For a four-partition layout, continue:

```bash
mkfs.btrfs -f /dev/target2p3
<!-- or ext4 -->
<!-- mkfs.ext4 -f /dev/target2p3 -->
```

##### 2.3.2.3 Mounting Partitions

Three-partition layout:

```bash
<!-- the filesystem hierarchy expects the system partition at /mnt, so mount / to /mnt -->
mount /dev/target1p6 /mnt
<!-- boot directory -->
mkdir /mnt/boot
<!-- mount the EFI boot partition -->
mount /dev/target1p4 /mnt/boot
```

For a four-partition layout, continue:

```bash
mkdir /mnt/home
mount /dev/target2p3 /mnt/home
```

#### 2.3.3 Verifying the Partition Layout

```bash
<!-- show size, filesystem type, mount point, and partition type after partitioning -->
lsblk -f
```

### 2.4 Linux Base

The Arch Linux ISO provides a Linux kernel, but you still need to install it with `pacstrap`. A minimal installation is shown below.

#### 2.4.1 Switching pacman Mirrors

```bash
vim /etc/pacman.conf
```

Uncomment `Color`. To do this: press `/Color` to find the line, then `bx` to uncomment and `:w` to save. Next, press `/mirrorlist` to jump to the mirrorlist include, then `gf` to open the included file. Keep only Chinese mirrors (for example: `/China` → `dgg` → `}` → `dG`), and reorder them by geographic proximity. For example, if NJU is close to you, move the NJU mirror to the top.

> note: Older mirror lists may need `reflector` to filter mirrors.

#### 2.4.2 Installing the Linux Kernel and Firmware

```bash
<!-- update the pacman database after changing mirrors -->
pacman -Sy
<!-- update the pacman GPG keyring -->
pacman -Syu archlinux-keyring
pacstrap /mnt base linux linux-firmware
<!-- important: generate /etc/fstab with UUIDs so the new system mounts partitions automatically at boot -->
genfstab -U /mnt >> /mnt/etc/fstab
```

This completes the minimal Linux and firmware installation.

### 2.5 Basic Configuration

#### 2.5.1 Base Configuration and Installation

```bash
vim /mnt/etc/locale.gen
```

Uncomment the `en_US.UTF-8` and `zh_CN.UTF-8` lines.

```bash
vim /mnt/etc/locale.conf
```

Write `LANG=en_US.UTF-8` or `LANG=zh_CN.UTF-8`.

```bash
<!-- {hostname} is the hostname you want -->
echo "127.0.0.1 ${hostname}.localdomain ${hostname}" >> /mnt/etc/hosts
echo "${hostname}" >> /mnt/etc/hostname
```

```bash
<!-- enter the root environment -->
arch-chroot /mnt
<!-- set the timezone -->
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
<!-- generate the locale for root -->
locale-gen
<!-- enter and confirm the root password -->
passwd
<!-- check the machine architecture -->
uname -a
<!-- install Intel CPU microcode; use amd-ucode for AMD CPUs -->
pacman -S intel-ucode efibootmgr grub
```

For dual-boot, continue:

```bash
<!-- install os-prober for dual-boot setups -->
pacman -S os-prober
```

By the way, many tutorials put the Windows EFI and the Unix-like system EFI on the same partition. I do not recommend this. As the Arch Wiki explains, it very easily damages the Windows boot entry, which is unacceptable.

#### 2.5.2 Installing GRUB

```bash
mkdir /boot/grub
<!-- make sure uname -a confirms an x86 architecture -->
grub-install --target=x86_64-efi --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg
```

#### 2.5.3 Network Tools

```bash
pacman -S networkmanager
systemctl enable NetworkManager
exit
reboot
```

### 2.6 User-Space Setup

First, log in as `root` with the root password.

#### 2.6.1 Wi-Fi Connection

```bash
<!-- make sure the Wi-Fi radio is enabled -->
nmcli radio wifi on
<!-- check device status; make sure the Wi-Fi device is not unavailable -->
nmcli device status
<!-- list nearby Wi-Fi networks -->
nmcli device wifi list
<!-- connect to your Wi-Fi (replace SSID and password with actual values) -->
nmcli device wifi connect "YOUR_WIFI_SSID" password "YOUR_PASSWORD"
<!-- example: nmcli device wifi connect TP-LINKxxx password 123456 -->
pacman -Syu
```

NetworkManager provides a TUI, so it is a friendly tool for wireless connections. Use `nmtui` in a terminal to view available Wi-Fi networks.

![nmtui](./pics/nmtui.png)

#### 2.6.2 Creating a User

```bash
# add the user to the wheel group
useradd -m -G wheel {username}
passwd {username} # e.g. passwd keith
# install neovim if you want; choose any editor you like (nano/emacs/vi/vim)
pacman -S sudo neovim
# symlink nvim as vi
ln -s /usr/bin/nvim /usr/bin/vi
visudo
```

Uncomment `%wheel ALL=(ALL:ALL) ALL` so members of the `wheel` group can run any command.

```bash
# switch to the user (replace keith with your username)
su keith
```

#### 2.6.3 Desktop and Common Configuration

##### 2.6.3.1 Additional Packages and Startup

- Base packages: `sudo pacman -S base-devel`
- Install paru from the AUR:

```bash
sudo pacman -S git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ~ && rm -rf paru/
```

- Proxy with Clash: `paru -S clash-verge-rev-bin`, load your subscription, and start in rule/global proxy mode.

##### 2.6.3.2 Terminal

At this point you can install software freely. I personally prefer `zsh`, so install `zsh` and make it the default shell.

```bash
# alternatives to kitty: wezterm/ghostty/alacritty/foot, etc.
# alternatives to zsh: fish/sh/bash/dash/csh, etc.
sudo pacman -S tmux kitty zsh
chsh -s $(which zsh)
zsh
# create an empty config first
touch ~/.zshrc
```

Below are two recommended zsh configuration frameworks. Choose one:

+ Option A: Oh My Zsh

```zsh
<!-- install Oh My Zsh -->
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install the plugins you need and configure them in `~/.zshrc`. You can refer to [autosuggestion](https://gist.github.com/n1snt/454b879b8f0b7995740ae04c5fb5b7df) for installation and configuration. Then run `source ~/.zshrc` to refresh the environment.

+ Option B: Zim

As the name suggests, this is a terminal framework suitable for `vim-based` users.

```zsh
<!-- install Zim -->
paru -S -noconfirm zimfw
```

Add the following to `~/.zshrc` as a basic configuration, then restart the terminal:

```zsh
ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Install missing modules and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source /usr/share/zimfw/zimfw.zsh init
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh
```

`Zim` provides a plugin system; you can find what you need in the [plugins](https://zimfw.sh/docs/) documentation.

> note: Adjust the `bindkey` settings in `.zshrc` according to your preferred editor. If you install `fzf` and `zsh`, your CLI workflow will be vibing. In particular, run `fzf --zsh` in the CLI to see common keybindings.

##### 2.6.3.3 Window Manager

This guide uses the Wayland compositor niri. If you do not like keyboard-driven or tiling desktops, choose GNOME or KDE instead. By the way, there is another window manager, [vxwm](https://github.com/wh1tepearll/vxwm), which I find very interesting.

```zsh
<!-- xwayland-satellite adds support for X11 applications -->
sudo pacman -S niri xwayland-satellite
# this step only generates the default config under .config
niri
```

Then press `ctrl+alt+f1/f2/f3` to switch to a TTY and log in as your user (here, `keith`). Edit the default configuration with `nvim ~/.config/niri/config.kdl` and change the default terminal from `alacritty` to `kitty`.

##### 2.6.3.4 Display Manager

```zsh
sudo pacman -S sddm
sudo systemctl enable --now sddm
```

You will then see the SDDM login screen. Enter your username and password to log in.

##### 2.6.3.5 Browser

Press `MOD + T` to open a terminal. The default `MOD` is the Windows key.

```zsh
sudo pacman -S firefox
```

##### 2.6.3.6 Font Management

```zsh
# install Chinese fonts and input method packages
sudo pacman -S fcitx5 fcitx5-configtool fcitx5-chinese-addons noto-fonts-cjk fcitx5-qt fcitx5-gtk
fcitx5-configtool
```

Search for `pinyin` and add it to the current default input method. You also need to download [nerd-fonts](https://www.nerdfonts.com/font-downloads). You can change the input method switching shortcut in the settings.

Optional fonts: `ComicShannsMono Nerd Font` / `JetBrains Nerd Font` / `Hack Nerd Font`.

```zsh
cd Downloads/
mkdir -p ~/.local/share/fonts/nerdfonts/
sudo pacman -S unzip
unzip '*.zip' -d ~/.local/share/fonts/nerdfonts/ && cd ~
<!-- alternative -->
<!-- sudo mkdir /usr/share/fonts/nerdfonts -->
<!-- unzip *.zip -d /usr/share/fonts/nerdfonts && cd ~ -->
# refresh the font cache
fc-cache -fv
# verify the installation
fc-list | grep -i "nerd"
```

> note: You need to set the `fcitx5` environment variables in niri's `environment {}` block. The configuration differs between graphical protocols (X11/Wayland). See [archwiki-fcitx](https://wiki.archlinuxcn.org/wiki/Fcitx_5) for details.

```kdl
environment {
    GTK_IM_MODULE "fcitx"
    QT_IM_MODULE "fcitx"
    XMODIFIERS "@im=fcitx"
}
spawn-at-startup "fcitx5"
```

##### 2.6.3.7 File Management

```zsh
<!-- yazi: TUI file manager -->
sudo pacman -S yazi imagemagick poppler 7zip resvg zoxide fd fzf ripgrep
<!-- file manager; nautilus needs to be configured in niri -->
sudo pacman -S nautilus nwg-look
<!-- pacman cache management -->
sudo pacman -S pacman-contrib archlinux-contrib
<!-- zathura PDF reader -->
sudo pacman -S zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps
<!-- WPS Office -->
paru -S wps-office ttf-wps-fonts
fc-cache -fv
```

If you are a vim-based user, `yazi` will work out of the box. A similar tool is `lf`; you can install it with `sudo pacman -S lf`, but it may require some extra configuration.

##### 2.6.3.8 Audio, Video, Clipboard, Drawing, and More

a. Clipboard: `sudo pacman -S cliphist wl-clipboard`

b. Audio and video:

```zsh
<!-- audio and video -->
<!-- no niri configuration needed -->
sudo pacman -S pipewire pipewire-pulse mpv ffmpeg
```

c. Drawing:

```zsh
<!-- no niri configuration needed -->
sudo pacman -S pinta
```

d. Brightness control:

```zsh
<!-- no niri configuration needed -->
sudo pacman -S brightnessctl
```

e. Bluetooth and file transfer:

```zsh
<!-- no niri configuration needed -->
<!-- enable the Bluetooth radio -->
rfkill unblock bluetooth
sudo pacman -S bluez bluez-utils
systemctl --user enable --now bluetooth
<!-- Bluetooth file transfer -->
sudo pacman -S bluez-obex
```

f. Screenshots:

+ Option A:

```zsh
<!-- niri configuration needed -->
<!-- grim as the screenshot tool, slurp as the region selector -->
<!-- configure the screenshot keybindings in niri afterwards -->
sudo pacman -S slurp grim
```

+ Option B (recommended):

```zsh
<!-- niri configuration needed -->
<!-- a more powerful screenshot tool -->
paru -S shotori
```

g. Color picker:

```zsh
<!-- niri configuration needed -->
<!-- use hyprpicker for RGB color picking; configure it in niri -->
sudo pacman -S hyprpicker
```

h. Wallpaper / backdrop:

```zsh
<!-- niri configuration needed -->
<!-- awww is the former swww; I use it for animated wallpaper backdrops in niri -->
<!-- otherwise you do not need it; noctalia can handle static wallpapers by itself -->
sudo pacman -S awww
```

I have listed my commonly used wallpaper resources under <a href="#Resources">Resources</a>.

i. Notifications (optional):

```zsh
<!-- niri configuration needed -->
<!-- mako is optional; you can also use noctalia's built-in notifications or dunst -->
sudo pacman -S mako
```

j. Authentication agent:

```zsh
<!-- niri configuration needed -->
sudo pacman -S polkit-kde-agent
```

k. Application launcher (optional, not needed for niri)

I need an application launcher because I also configure the `River` window manager (note: `River` became a compositor after v0.4; here I mean river classic). I recommend `fuzzel` or `wofi`; `rofi` is also an option.

```zsh
sudo pacman -S fuzzel
<!-- alternatives -->
sudo pacman -S wofi
sudo pacman -S rofi
```

Note: Configure keybindings in niri for the applications above that require them.

##### 2.6.3.9 Version Control

```zsh
<!-- git was installed earlier -->
sudo pacman -S openssh github-cli
git config --global user.name "YOUR_GITHUB_NAME"
git config --global user.email "YOUR_GITHUB_EMAIL"
ssh-keygen -t ed25519 -C "YOUR_GITHUB_EMAIL"
# copy to the clipboard
cat ~/.ssh/xxxx.pub | wl-copy
```

Add the public key to GitHub, then verify with `ssh -T git@github.com`. Finally, run `gh auth login`.

##### 2.6.3.10 Package Managers and Build Tools

```zsh
<!-- package managers -->
sudo pacman -S wget npm nodejs uv yarn
<!-- build tools -->
sudo pacman -S cmake ninja meson
```

`wget` is a common network download tool. `npm` and `yarn` are common package managers, and `uv` has become a popular Python project management tool. `cmake` is the de facto project configuration tool for C/C++ development. `ninja` is a lightweight, fast build system and has gradually become one of the efficient replacements for `make`. `meson` is optional here; I choose it as an alternative to `cmake` because it is more modern and its syntax is more intuitive. In contrast, `cmake`'s tedious case switching and quoting/wildcard rules do not fit modern language design standards.

##### 2.6.3.11 Noctalia Desktop

```zsh
sudo pacman -S noctalia
<!-- start noctalia and configure it in its GUI -->
noctalia
```

Add `spawn-at-startup "noctalia"` to niri so Noctalia starts at boot. You still need to configure Noctalia manually in its GUI.

<center>
    <img src="./pics/niri-desktop.png" alt="after configuration">
    <p>The Noctalia desktop after configuring niri</p>
</center>
<center>
    <img src="./pics/overview.png" alt="after configuration">
    <p>Overview of the Noctalia shell</p>
</center>

##### 2.6.3.12 Agents

Here are two open-source agents. Whether you use them for single-scenario vibe coding or complex agentic workflows, they are more than enough once you master the harness. You can also consider other general/coding agents such as Codex or Claude Code.

```zsh
<!-- PI Agent -->
npm install -g --ignore-scripts @earendil-works/pi-coding-agent
<!-- or opencode -->
sudo pacman -S opencode
```

##### 2.6.3.13 Misc

1. btop (optional)

A practical, lightweight system monitor written in C.

```zsh
sudo pacman -S btop
```

2. fastfetch (optional)

A practical CLI system information tool. You can easily replace it with a bash or Python script.

```zsh
sudo pacman -S fastfetch
```

3. duf (optional)

A useful tool for viewing filesystem information.

```zsh
sudo pacman -S duf
```

![btop-fastfetch-duf](./pics/duf-fas-btop.png)

I also recommend [rstop](https://fan-ziqi.github.io/rstop/), a modern system monitor written in Rust.

![rstop](./pics/rstop.png)

It combines the functionality of `btop`, `fastfetch`, and `duf`.

4. bat

A modern replacement for `cat` that prints file contents with syntax highlighting in the terminal.

```zsh
sudo pacman -S bat
<!-- list available themes -->
bat --list-themes
<!-- build the cache so themes take effect -->
bat --cache build
<!-- you can also try creating a custom theme -->
```

5. tree / tre

CLI directory-tree tools, commonly used for large projects or deeply nested directories. You can choose the traditional `tree` tool or its modern alternative.

### 2.7 Dual-Boot Notes

> Most "random" problems in a Windows + Arch dual-boot setup can ultimately be traced back to Windows power states and the ESP.

#### 2.7.1 Disable Windows Fast Startup and Hibernation

Windows enables "Fast Startup" by default. In this state, "shutdown" is not a full shutdown but a hybrid shutdown: the kernel and some PCIe device states are saved. After switching to Linux, you may see:

- Wi-Fi cannot be enabled: `rtw88_8822be ... Unable to change power state from D3cold to D0 ...`
- Occasionally stuck at GRUB's `Loading initial ramdisk`
- Other PCIe / network / USB devices occasionally unavailable

Run the following in an Administrator terminal on Windows:

```bat
powercfg /a
powercfg /h off
```

Then confirm in the GUI:

```text
Control Panel → Hardware and Sound → Power Options
→ Choose what the power buttons do
→ Change settings that are currently unavailable
→ Uncheck "Turn on fast startup (recommended)"
→ Save changes
```

Verify:

- Hibernation is shown as disabled in `powercfg /a`
- "Turn on fast startup" is no longer checked in Control Panel

> `powercfg /h off` disables both hibernation and fast startup. Keeping hibernation is not recommended for dual-boot.

#### 2.7.2 Habits When Switching from Windows to Linux

- After disabling fast startup, Windows "shutdown" is a real shutdown, and you can boot Linux normally.
- If you cannot disable fast startup for now: use "Restart" in Windows to enter Linux, not "Shut down".
- Avoid starting Linux after Windows has hibernated.

#### 2.7.3 ESP and Boot

- Do not share the same ESP with Windows; a separate ESP for Arch is safer.
- For multi-boot, install `os-prober` and make sure `/etc/default/grub` contains:

  ```text
  GRUB_DISABLE_OS_PROBER=false
  ```

- Regenerate the configuration after changing it:

  ```bash
  sudo grub-mkconfig -o /boot/grub/grub.cfg
  ```

- Do not format Windows' ESP or recovery partitions.

#### 2.7.4 Time

Windows treats the RTC as local time by default, while Linux treats it as UTC. If the two systems differ by 8 hours:

```bash
timedatectl set-local-rtc 0
timedatectl set-ntp true
```

You can also make Windows use UTC (optional):

```bat
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /t REG_DWORD /d 1 /f
```

#### 2.7.5 Recheck After Windows Updates

Windows feature updates may re-enable fast startup. If Wi-Fi or boot problems appear, check first:

```bat
powercfg /a
```

Then check "Turn on fast startup" in Control Panel.

#### 2.7.6 Quick Troubleshooting

If Wi-Fi misbehaves under Linux:

```bash
rfkill list
nmcli device status
journalctl -b -k | grep -iE 'rtw88|iwlwifi|firmware|D3cold'
```

If you see `D3cold to D0` or `mac power on failed`:

1. Boot back into Windows and confirm fast startup is disabled.
2. Shut down completely, unplug power, and hold the power button for 15–30 seconds.
3. Boot Linux again.

## III. Agentic Install

> This section turns Manual Steps into a process that can be handed off to an agent. Core principle: **humans confirm irreversible operations; the agent executes verifiable steps**. Do not treat the agent as a black box that will magically guess disks and partitions.

### 3.1 Role Boundaries

| Step | Human | Agent |
| :--- | :---: | :---: |
| Boot the live ISO, connect to the network | ✅ | ❌ |
| Install/start sshd, obtain the IP | ✅ | ❌ |
| Disk identification | Review | ✅ Read-only collection |
| Partition plan | ✅ Final confirmation | ✅ Generate proposal |
| Partitioning / formatting | After confirmation | ✅ Execute |
| pacstrap / chroot configuration | ❌ | ✅ |
| Bootloader | Review | ✅ |
| Reboot, remove USB, select boot entry | ✅ | ❌ |
| Post-boot verification | ❌ | ✅ Reconnect via SSH |

The agent **must not** execute the following without human confirmation:

```text
sgdisk --zap-all / mkfs.* / grub-install / delete ESP / dd
```

### 3.2 Prerequisite: Live Environment (Manual)

The goal of this part is to let the agent access the live environment over SSH. The target system's hostname, users, and passwords are not configured here; they are configured later inside `arch-chroot`.

#### 3.2.1 Network

Wi-Fi:

```bash
rfkill unblock wifi
iwctl device list
iwctl station <wlan> get-networks
# non-interactive
iwctl station <wlan> connect <SSID> password <password>
# ---
# interactive
iwctl
station <wlan> connect <SSID>
# ---
ping -c 3 archlinux.org
```

> `iwctl ... password` leaves the password in shell history. The interactive method omits the `password` argument and prompts for it.

Wired:

```bash
ip link
pacman -Sy dhcpcd   # if not present in the live environment
dhcpcd <iface>
ping -c 3 archlinux.org
```

#### 3.2.2 Time Synchronization

```bash
timedatectl set-ntp true
timedatectl status
```

#### 3.2.3 Install and Start SSH

```bash
pacman -Sy openssh
systemctl enable --now sshd
systemctl status sshd --no-pager
ss -tlnp | grep :22
```

#### 3.2.4 Authentication

SSH keys are recommended:

```bash
mkdir -p /root/.ssh
chmod 700 /root/.ssh
cat > /root/.ssh/authorized_keys <<'EOF'
ssh-ed25519 AAAA... you@laptop
EOF
chmod 600 /root/.ssh/authorized_keys
```

If you temporarily log in with the root password, note that Arch defaults to `PermitRootLogin prohibit-password`. Setting a root password alone is not enough; you must explicitly allow password login:

```bash
sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
systemctl restart sshd
passwd root
```

> This is only for a temporary live environment on a LAN. Do not expose port 22 to the public internet.

#### 3.2.5 Get the IP and Verify the Host Key

```bash
ip -br a
ssh-keygen -lf /etc/ssh/ssh_host_ed25519_key.pub
```

Verify the fingerprint on the client:

```bash
ssh-keyscan -t ed25519 <live-ip> 2>/dev/null | ssh-keygen -lf -
```

#### 3.2.6 Start tmux

The installation may take a long time. Run all commands inside tmux so you can reconnect after an SSH disconnect:

```bash
tmux new -s install
```

### 3.3 How the Agent Connects

Run the agent on **another machine** (a laptop or VPS) and operate the live environment over SSH. This way, after a reboot the agent can reconnect to the new system for verification.

If the agent runs inside the live environment itself, its process, logs, and state disappear after `reboot`, making post-install verification impossible.

Recommended connection parameters:

```bash
ssh -o ServerAliveInterval=30 \
    -o ControlMaster=auto \
    -o ControlPersist=10m \
    root@<live-ip>

# attach to the existing session after connecting
tmux attach -t install
```

### 3.4 Staged Execution

#### Phase 0: Read-Only Discovery

In the first phase, the agent may only read; it must not write to disk. Collect:

```bash
lsblk -o NAME,SIZE,MODEL,SERIAL,TYPE,FSTYPE,MOUNTPOINTS
blkid
ls -l /dev/disk/by-id/
[ -d /sys/firmware/efi ] && echo UEFI || echo BIOS
lscpu | grep -E 'Model name|Vendor ID'
free -h
ip -br a
timedatectl
```

Produce a summary containing at least:

- The target disk's by-id path, model, serial number, and capacity
- UEFI or BIOS
- CPU vendor (determines `intel-ucode` / `amd-ucode`)
- Existing partitions, filesystems, whether an ESP already exists, and whether this is a dual-boot system
- RAM size (determines the swap strategy)

#### Phase 1: Generate an Installation Plan

The agent outputs a plan first and does not execute it. Template:

```text
Target disk: /dev/disk/by-id/<...>
Firmware: UEFI / BIOS
Partitions:
  - ESP      512M  fat32   /boot
  - swap     4G    swap
  - root     rest  btrfs   /
  - home     optional btrfs /home
Filesystem: btrfs / ext4
Bootloader: GRUB (UEFI)
Hostname: <hostname>
User: <user>  Group: wheel  Shell: /bin/bash
Timezone: Asia/Shanghai
Locale: en_US.UTF-8 / zh_CN.UTF-8
Microcode: intel-ucode / amd-ucode
Network: NetworkManager
Services: sshd, NetworkManager
Dotfiles: git clone <repo> (after first boot)
Rollback: keep the live USB
```

Only after a human confirms the by-id path, partition plan, and filesystem should Phase 2 begin.

> note: You can create a script for the agent to execute, or output a text file describing your disk partition preset in natural language, effectively giving the agent a task plan to execute.

#### Phase 2: Partitioning and Formatting

The script must receive the disk explicitly. Never guess from `lsblk` order:

```bash
TARGET=/dev/disk/by-id/<...>

[ -b "$TARGET" ] || { echo "target not found: $TARGET"; exit 1; }
lsblk -o NAME,SIZE,MODEL,SERIAL,TYPE,FSTYPE,MOUNTPOINTS "$TARGET"

read -r -p "Type YES to wipe $TARGET: " ans
[ "$ans" = "YES" ] || exit 1
```

UEFI example (`sgdisk` is in the `gdisk` package; install it in the live environment with `pacman -S gdisk` if needed):

```bash
sgdisk --zap-all "$TARGET"
sgdisk -n 1:0:+512M -t 1:ef00 -c 1:ESP  "$TARGET"
sgdisk -n 2:0:+4G   -t 2:8200 -c 2:swap "$TARGET"
sgdisk -n 3:0:0     -t 3:8300 -c 3:root "$TARGET"
partprobe "$TARGET"
```

> BIOS machines should not create an ESP; they need an additional `bios_grub` partition and `grub-install --target=i386-pc`. For dual-boot, do not format the ESP shared with Windows.

Format and mount:

```bash
mkfs.fat -F32 "${TARGET}-part1"
mkswap "${TARGET}-part2"
swapon "${TARGET}-part2"

# choose one
mkfs.btrfs -f "${TARGET}-part3"
# mkfs.ext4 -F "${TARGET}-part3"

mount "${TARGET}-part3" /mnt
mkdir -p /mnt/boot
mount "${TARGET}-part1" /mnt/boot

# optional /home
# mkdir -p /mnt/home
# mount "${TARGET}-part4" /mnt/home
```

#### Phase 3: Install the Base System

```bash
pacman -Sy archlinux-keyring
pacstrap -K /mnt \
  base base-devel linux linux-firmware \
  btrfs-progs e2fsprogs \
  networkmanager openssh sudo git neovim \
  grub efibootmgr

# choose Intel or AMD
# pacstrap -K /mnt intel-ucode
# pacstrap -K /mnt amd-ucode

# only needed for dual-boot
# pacstrap -K /mnt os-prober

genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
```

#### Phase 4: chroot Configuration

The non-interactive parts can be executed in one pass:

```bash
arch-chroot /mnt /bin/bash -e <<'EOF'
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

sed -i 's/^#en_US.UTF-8/en_US.UTF-8/; s/^#zh_CN.UTF-8/zh_CN.UTF-8/' /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

echo '<hostname>' > /etc/hostname
cat >> /etc/hosts <<'HOSTS'
127.0.0.1   localhost
::1         localhost
127.0.1.1   <hostname>.localdomain <hostname>
HOSTS

useradd -m -G wheel -s /bin/bash <user>

echo '%wheel ALL=(ALL:ALL) ALL' > /etc/sudoers.d/10-wheel
chmod 440 /etc/sudoers.d/10-wheel
visudo -c

systemctl enable NetworkManager
systemctl enable sshd
mkinitcpio -P

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
EOF
```

> The target system allows normal users to log in with a password by default. After the first login, configure SSH keys and then tighten `PasswordAuthentication` / `PermitRootLogin`.

Passwords are interactive. Set them separately (preferably with `ssh -t` or inside tmux) to avoid writing them into heredocs or logs:

```bash
arch-chroot /mnt passwd root
arch-chroot /mnt passwd <user>
```

> For automation, you can use `chpasswd`, but make sure the password does not enter shell history, logs, or the agent context.

#### Phase 5: Pre-Reboot Verification

```bash
findmnt -R /mnt
cat /mnt/etc/fstab
arch-chroot /mnt mkinitcpio -P
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg
arch-chroot /mnt efibootmgr -v
arch-chroot /mnt systemctl is-enabled NetworkManager sshd
arch-chroot /mnt passwd -S <user>
arch-chroot /mnt visudo -c
ls /mnt/boot/EFI/GRUB/grubx64.efi
```

Confirm the following before rebooting:

- `/etc/fstab` uses UUIDs, and both the ESP and root partition are correct.
- `grubx64.efi` exists, and `efibootmgr` has a corresponding boot entry.
- `NetworkManager` and `sshd` are enabled.
- The user exists, the password is set, and `wheel` works.
- The initramfs has been generated.

Reboot:

```bash
umount -R /mnt
swapoff -a
reboot
```

> The human is responsible for removing the USB drive, selecting the boot entry, and handling Secure Boot / LUKS prompts. The agent cannot operate firmware menus.

#### Phase 6: Post-Install Verification

After rebooting, the target machine's IP may change, and so will its host key:

```bash
ssh-keygen -R <target-ip>
ssh <user>@<target-ip>
```

Verify:

```bash
systemctl status sshd NetworkManager --no-pager
systemctl is-enabled sshd NetworkManager
ip -br a
ping -c 3 archlinux.org
timedatectl
locale
getent passwd <user>
sudo -l -U <user>
findmnt / /boot
```

Once everything passes, connect to Wi-Fi as described in Manual Steps 2.6.1, then continue with the user-space configuration in 2.6.3 (dotfiles, desktop, fonts, etc.).

### 3.5 Agent Ground Rules

- **Read first, write later**: Phase 0 only collects information and makes no changes.
- **Dangerous commands require explicit confirmation**: partitioning, formatting, bootloader, deleting the ESP, `dd`.
- **Use only by-id disk paths**: do not accept paths such as `sdX` or `nvme0n1` that may change.
- **Use `set -euo pipefail` in scripts**: stop on failure; do not "guess a fix" automatically.
- **Log all long-running commands**: `tee` to a file so you can diagnose after a disconnect.
- **Never record passwords**: they must not appear in command lines, logs, or the agent context.
- **Verify before reboot**: bootloader, fstab, network, sshd, users.
- **Keep a rollback path**: do not remove the live USB early; do not touch the Windows ESP in a dual-boot setup.
- **Distinguish live from target**: the live root password is only for SSH; the target user/password are configured inside chroot.

### 3.6 Suggested Script Layout

```text
~/dotfiles/arch_intall_instruction/agentic/
├── 00-discover.sh     # read-only collection
├── 10-plan.md         # installation plan template
├── 20-partition.sh    # explicit TARGET_DISK, dry-run + second confirmation
├── 30-install.sh      # pacstrap + genfstab
├── 40-chroot.sh       # locale/timezone/hostname/user/sudo/sshd/NetworkManager/bootloader
├── 50-verify.sh       # pre-reboot checks
└── run.sh             # run stages in tmux, supports resuming
```

When handing this off to an agent, give it these constraints directly:

```text
You are an Arch installation assistant. First run 00-discover.sh in read-only mode and output a disk/firmware/partition summary and an installation plan.
Do not execute any disk-writing command until I explicitly confirm TARGET_DISK and the partition plan.
Report the result after each Phase and wait for confirmation; stop immediately on failure and do not guess a fix.
```

### 3.7 Optional: Declarative Install

If you do not want to maintain handwritten scripts, you can ask the agent to generate an `archinstall` configuration:

```bash
archinstall --config user_configuration.json --config user_credentials.json
```

The advantage is that disks, users, packages, and services become reviewable JSON. The disadvantage is that it may not exactly match the layout in Manual Steps (btrfs, GRUB, partition naming), so review the generated configuration first.

### 3.8 Common Pitfalls

- The live ISO does not start sshd by default; run `systemctl enable --now sshd` before connecting.
- Password login as root requires `PermitRootLogin yes`; keys are recommended.
- The live environment is a RAM disk; do not keep scripts/logs only in `/root`.
- If the target system's network is not configured, SSH will be unreachable after reboot.
- The host key changes after reboot; use `ssh-keygen -R`.
- Do not format a shared ESP in a dual-boot setup; the Windows boot entry is fragile.
- Dual-boot requires `os-prober`; set `GRUB_DISABLE_OS_PROBER=false` in `/etc/default/grub`, then run `grub-mkconfig`.
- Secure Boot, LUKS passphrases, and firmware boot menus require manual action.
- Do not stay in a partially upgraded state after `pacman -Sy`; run `pacman -Syu` once inside chroot after installation.
- Old ISOs may have an expired keyring: `pacman -Sy archlinux-keyring`.
- Do not copy UEFI `grub-install` commands to BIOS machines.

### 3.9 Minimal Acceptance Checklist

- [ ] The target disk is `/dev/disk/by-id/...`
- [ ] The UEFI/BIOS branch is correct, and the ESP was not accidentally formatted
- [ ] `findmnt -R /mnt` shows the correct mount hierarchy
- [ ] `/etc/fstab` uses UUIDs
- [ ] `mkinitcpio -P` succeeded
- [ ] `efibootmgr -v` has a boot entry and `grubx64.efi` exists
- [ ] `NetworkManager` and `sshd` are enabled
- [ ] The user exists, the password is set, and `wheel` works
- [ ] SSH login works after first boot
- [ ] `ping`, DNS, and time synchronization work
- [ ] The live USB is still available as a rollback option

# P2. Linux Selection

In the preface, we mentioned that Arch Linux is not friendly to Linux beginners. Below are common distributions ordered by learning curve, from lowest to highest. The point is not to compare which is "stronger", but to see the trade-offs of each system: how fast it updates, whether it can roll back when broken, and whether problems are solved through documentation or by yourself.

> Answer three questions before choosing:
>
> 1. Do you want "install it and forget it" stability, or "always latest" rolling updates?
> 2. When the system breaks, do you prefer "reinstall" or "roll back to a snapshot"?
> 3. How new is your hardware? New CPUs, new network cards, and dual-GPU laptops usually need newer kernels and firmware.

## I. Conclusion First

| Distribution | Base | Update model | Package manager | Difficulty | One-liner |
| :--- | :--- | :--- | :--- | :---: | :--- |
| Linux Mint | Ubuntu LTS | Fixed | apt | ★ | The least painful choice when coming from Windows |
| Ubuntu LTS | Debian | Fixed | apt + snap | ★ | Largest ecosystem and the most tutorials |
| Fedora Workstation | Independent | ~6 months | dnf | ★★ | Upstream new technologies land here first |
| Pop!_OS | Ubuntu LTS | Fixed | apt | ★ | Works out of the box on laptops and discrete GPUs |
| Debian Stable | Independent | ~2 years | apt | ★★ | Stable to the point of boredom; older software |
| openSUSE Tumbleweed | Independent | Rolling | zypper | ★★ | btrfs snapshots by default; safe to roll |
| EndeavourOS | Arch | Rolling | pacman + AUR | ★★ | A graphical installer close to vanilla Arch |
| Manjaro | Arch | Rolling (delayed) | pacman + pamac | ★★ | A "gentler" Arch |
| CachyOS | Arch | Rolling | pacman + AUR | ★★★ | Arch optimized for performance |
| NixOS | Independent | Rolling / 6 months | nix | ★★★★ | Declarative, reproducible, rollback-capable |
| Gentoo | Independent | Rolling | portage | ★★★★★ | Source-based, full control |
| Void Linux | Independent | Rolling | xbps | ★★★ | No systemd; small and fast |

## II. Beginner-Friendly

### 2.1 Linux Mint

Positioning: **for people who just want to use their computer**.

- Based on Ubuntu LTS, with Cinnamon, MATE, and Xfce desktops; the default layout is close to Windows
- Does not push snap by default; the software center focuses on deb and Flatpak, with little controversy
- Includes Timeshift for system snapshots
- Drivers, fonts, and Chinese input methods basically work out of the box
- Conservative updates, suitable for office work, browsing, and media

Drawbacks:

- Software versions are older; kernels, desktops, and development tools lag behind
- New hardware (especially new GPUs and network cards) may not be recognized; you may need the HWE kernel
- Not suitable for people who want to tinker with Wayland or tiling window managers

Suitable for: desktop users using Linux long-term for the first time, and machines built for family members.

### 2.2 Ubuntu LTS

- Largest ecosystem: almost all commercial software, drivers, and tutorials support Ubuntu first
- LTS releases every two years, with standard security maintenance for 5 years; Ubuntu Pro can extend it further
- GNOME desktop, Wayland by default
- Dual-track `apt` and `snap`; snap startup speed and mount model have always been controversial
- Servers and desktops use the same system, making documentation easy to find

Drawbacks: snap is pushed aggressively, GNOME customization is limited, and the default installation includes a lot of software. For a cleaner Ubuntu, consider Linux Mint, Pop!_OS, or Debian.

### 2.3 Fedora Workstation

- A new release about every 6 months, with each release supported for about 13 months
- Upstream innovations land fastest: new kernels, new GNOME, Wayland, PipeWire, and SELinux enabled by default
- `dnf` package management; software is newer than Ubuntu but more stable than Arch
- High-quality community documentation and Red Hat ecosystem resources
- Suitable for developers and people who want "new software without fixing their system every day"

Drawbacks: short release lifecycle, requiring regular major upgrades; some proprietary drivers and multimedia codecs require enabling RPM Fusion.

### 2.4 Pop!_OS

- Made by System76, based on Ubuntu LTS
- Provides an ISO with NVIDIA drivers, making dual-GPU laptop switching relatively painless
- In-house COSMIC desktop, friendly to tiling and keyboard-driven workflows
- Has a separate recovery partition; if the system breaks, you can boot into the recovery environment

Drawbacks: optimized mainly for System76 hardware; it works on other machines but the advantages are less obvious. COSMIC is still evolving quickly.

### 2.5 Debian Stable

- One of the most "stable" general-purpose distributions, usable on both servers and desktops
- Release cycle of about two years; security support plus LTS can cover many years
- `apt` package management; packages are tested for a long time and almost never break the system through updates
- Fully community-driven, with no commercial bundling
- Excellent documentation such as the Debian Handbook and Wiki

Drawbacks: older software; new hardware may require a backports kernel first; firmware policy is conservative, so remember to enable non-free firmware during installation.

Suitable for: machines that should run for years without changes, home servers, and old laptops.

### 2.6 openSUSE Tumbleweed and Leap

- Leap is a fixed release, more enterprise-oriented and stable; Tumbleweed is rolling
- `zypper` package management; YaST provides broad graphical and terminal management tools
- btrfs plus snapper by default, with automatic snapshots before each update; roll back if an update breaks
- Very good KDE Plasma support
- Suitable for people who want rolling updates but are afraid of breakage

Drawbacks: package management commands differ from mainstream apt and dnf; configuring domestic mirrors takes some time; Tumbleweed has a large update volume.

### 2.7 Looks First: Zorin OS and elementary OS

- Zorin OS: based on Ubuntu LTS; themes and layouts can imitate Windows or macOS, suitable for people who do not want to learn a new interaction model
- elementary OS: based on Ubuntu LTS, Pantheon desktop, macOS-like design, with a consistent in-house application style

Both follow the "good-looking, good enough, don't tinker" path. The cost is a smaller software ecosystem and less customizability than mainstream desktops.

## III. Immutable and Atomic Updates

The idea behind this class of systems: **the system partition is based on a read-only image, updates replace the whole image, and problems can be rolled back to the previous version**.

- Fedora Silverblue and Kinoite: atomic Fedora with GNOME and KDE; applications mainly use Flatpak and containers
- Bazzite: based on Fedora atomic images, preconfigured for gaming, drivers, and handheld support
- openSUSE Aeon: GNOME atomic edition aimed at "zero-maintenance" desktops

Advantages: the system is hard to break yourself, updates can be rolled back, and it suits people who do not want to maintain the system.

Drawbacks: modifying low-level parts (drivers, kernel modules, things under `/usr`) is more convoluted than on traditional distributions; many tutorials do not apply.

## IV. Arch Family: Want Arch Without a Manual Install

### 4.1 EndeavourOS

Positioning: **the "installer edition" closest to vanilla Arch**, and the most recommended option for people who want to learn Arch but are discouraged by manual installation.

- Based on Arch, rolling release, using the official Arch repositories plus a small EndeavourOS repository
- Provides the Calamares graphical installer; partitioning, users, and desktop in one pass
- Preconfigures `yay` (AUR helper), networking, mirrors, and basic themes
- Offers KDE Plasma, GNOME, Xfce, i3, Sway, and other desktops or window managers
- After installation it is basically standard Arch: `pacman`, AUR, and the Arch Wiki all apply
- The community is more beginner-oriented than official Arch, and forum answers are usually patient

Drawbacks:

- Still rolling release; you still need to read update announcements, especially for kernels, NVIDIA, and glibc
- Does not set up btrfs snapshots and rollback for you; configure snapper or Timeshift on important machines
- The Arch Wiki is still the main reference when problems occur, so English reading skills help

Suitable for: people who want to use Arch long-term and need the AUR, but do not want to start from `pacstrap`.

### 4.2 Manjaro

- Based on Arch but uses its own repositories; packages are delayed for more testing
- `pamac` graphical package manager and `mhwd` hardware detection tool are beginner-friendly
- Rolling release, but slower than Arch
- Heavily preconfigured, with a complete out-of-the-box experience

Drawbacks: mixing delayed repositories with the AUR can cause dependency problems; historically there have been incidents such as expired certificates and AUR packages out of sync with repositories. People who want a "pure Arch experience" should prefer EndeavourOS.

### 4.3 CachyOS

- Based on Arch, focused on performance: x86-64-v3/v4 optimized packages, BORE and other schedulers, optional low-latency kernels
- Provides the Calamares installer with many desktop choices
- Has its own optimized repositories and toolchain
- Suitable for gaming, compiling, and people chasing frame rates and responsiveness

Drawbacks: the combination of optimized packages and the AUR occasionally has compatibility issues; when problems occur you need to understand Arch-family troubleshooting. Beginners should not make it their first Arch.

### 4.4 Arch and archinstall

- The official ISO includes `archinstall`, which can semi-automate partitioning, base installation, desktop, and users
- The result is standard Arch with no extra wrapper
- Suitable for people who have decided to learn Arch but do not want to type every step manually

Drawbacks: `archinstall` is not omnipotent; complex partition layouts or dual-boot still require manual work, and you must maintain the installed configuration yourself.

## V. Advanced

### 5.1 NixOS

Positioning: **write the entire machine as code**.

- Use `/etc/nixos/configuration.nix` to declaratively describe the system: software, services, users, kernel parameters, desktop
- Each `nixos-rebuild switch` creates a new generation; you can roll back to any old version from the boot menu
- Reproducible: the same configuration produces broadly the same environment on different machines
- The `nix` package manager can also be installed and used separately on other distributions
- Flakes plus home-manager can bring dotfiles into version control
- Very suitable for people who like "configuration as code" and frequently change machines

Drawbacks:

- Steep learning curve: the Nix language, module system, package overlays, and error messages all take time to get used to
- Many traditional tutorials do not apply; copying commands often does not work
- Fewer Chinese-language resources
- Proprietary drivers and some desktop software require extra configuration

Suitable for: people willing to invest one or two weeks to learn, who value reproducibility and rollback. Before installing, read the official manual and look at tools such as `nixos-anywhere` and `disko`.

### 5.2 Gentoo

Positioning: **assemble your own system from source**.

- Source-based distribution with `portage` package management and rolling updates
- `USE` flags decide which features are compiled into each piece of software, allowing very lean builds
- You choose the kernel, drivers, and services yourself, and truly understand how Linux is put together
- The official Handbook is excellent and a great learning resource
- There is now an official binary package repository, so you can skip most compilation and it is friendlier than in the past

Drawbacks:

- Compilation takes time, especially desktop environments and browsers; old machines may take a whole day
- Dependency and USE conflicts must be resolved yourself
- High update frequency; upgrading after a long gap can be painful
- Not suitable for people who do not want to maintain their system

Suitable for: people who want to deeply understand Linux and are willing to spend time compiling and tuning, or who want to experiment on old machines.

### 5.3 Void Linux

- Independent distribution, does not use systemd; uses `runit` for service management
- `xbps` package management, rolling release, fast boot, and low resource usage
- Available in glibc and musl variants
- Suitable for old hardware, minimal desktops, and people who want to avoid systemd

Drawbacks: smaller software ecosystem than Debian and Arch; no systemd means some software needs extra adaptation; fewer Chinese-language resources.

### 5.4 Alpine Linux (Awareness Only)

- musl libc plus BusyBox plus OpenRC; extremely small images
- `apk` package management, with stable branches and the rolling `edge` branch
- Mainly used for containers, embedded systems, and routers, not daily desktops
- Desktops are possible, but glibc compatibility layers and drivers will cost you a lot of time

### 5.5 Slackware and LFS (Awareness Only)

- Slackware: one of the oldest surviving distributions; it does not resolve dependencies automatically and configuration is entirely manual, suitable for experiencing traditional Unix
- LFS (Linux From Scratch): build the entire system from source by following a book; purely educational and not recommended for daily use

These two are more like "courses" than "daily systems".

## VI. How to Choose: By User Type

| Your situation | Recommendation |
| :--- | :--- |
| First Linux install, just want stability | Linux Mint, Ubuntu LTS |
| New laptop, dual GPU, need NVIDIA | Pop!_OS, Fedora, EndeavourOS |
| Want new software but do not want to fix the system daily | Fedora Workstation |
| Old computer, low specs | Debian with Xfce, Linux Mint Xfce, Void |
| Want Arch and the AUR but not manual installation | EndeavourOS / CachyOS |
| Want rolling updates but fear breakage | openSUSE Tumbleweed (snapshots by default) |
| Chase performance and gaming | CachyOS, Bazzite |
| Like configuration as code and reproducibility | NixOS |
| Want to thoroughly understand Linux | Gentoo, LFS |
| Do not want to maintain the system | Fedora Silverblue, openSUSE Aeon |

## VII. The Lowest Trial-and-Error Cost

1. **Ventoy USB drive plus a live ISO**: do not install; boot it first and check whether your hardware is recognized, especially Wi-Fi, sound, touchpad, and graphics.
2. **Virtual machine**: VirtualBox, KVM, or GNOME Boxes. Good for trying desktops and the installation flow, but not for testing real GPUs.
3. **Dual-boot**: shrink the Windows partition first, then install Linux. Pay attention to the Windows fast startup issue in the previous section.
4. **A separate disk**: the least troublesome option; switch boot entries in the BIOS, and the two systems do not interfere with each other.

> Do not partition your only disk without a backup. Before installing, confirm the Windows BitLocker recovery key, the EFI partition location, and the partition table type (GPT or MBR).

<a id="Resources"></a>
# P3. Resources

- Ventoy: https://www.ventoy.net/cn/index.html
- Rufus:
  - https://rufus.ie/zh/
  - Microsoft Store
  - https://github.com/pbatard/rufus has different versions under Releases
- Arch Linux ISO
  - Tsinghua mirror: https://mirrors.tuna.tsinghua.edu.cn/archlinux/iso/
  - NJU mirror: https://mirrors.nju.edu.cn/archlinux/iso/
- Oh-my-zsh
  - https://ohmyz.sh/#install
  - https://gist.github.com/n1snt/454b879b8f0b7995740ae04c5fb5b7df
- Zim framework
  - https://github.com/zimfw/zimfw
  - https://zimfw.sh/docs/install/
- Wallpapers
  - https://github.com/dharmx/walls
  - https://wallhaven.cc/
- Terminal emulators
  - https://terminaltrove.com/terminals/
