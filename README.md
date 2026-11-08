<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Arch Linux Dotfiles](#arch-linux-dotfiles)
  - [1. Display Manager/Portal](#1-display-managerportal)
  - [2. Window Manager](#2-window-manager)
  - [3. Shell](#3-shell)
  - [4. Other Applications](#4-other-applications)
  - [5. River WM](#5-river-wm)
  - [6. Deployment](#6-deployment)
  - [Reference](#reference)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Arch Linux Dotfiles

Here is a configuration for Arch Linux with River Classic and Niri WM.

At the beginning, refer to `Arch/arch_intall_instruction/README.md` to install Arch Linux and the base infrastructure. A short overview follows.

---

## 1. Display Manager/Portal

SDDM with silent greeter.

## 2. Window Manager

River Classic and Niri.

> This is River Classic, not the River compositor.

## 3. Shell

- **bash** for River Classic, configured by `Arch/.bashrc` on top of [bash-it](https://github.com/Bash-it/bash-it).
- **zsh** + Oh My Zsh for Niri, shared through the `Arch/shared` submodule.
- Noctalia v5 is the desktop shell (bar, launcher, notifications), not the login shell.

## 4. Other Applications

Applications, either installed or recommended, are described in `Arch/arch_intall_instruction/README.md` specifically.

## 5. River WM

This repo also provides an extra River Classic setup for suckless-style workflows. Niri and River share the same terminal, colors and helper scripts, but River keeps its own keybindings and status bar.

Main files:

| Path | Purpose |
| :-- | :-- |
| `Arch/river/init` | River autostart and keybindings |
| `Arch/local/bin/dam-status` | Status text provider for `dam` |
| `Arch/local/bin/dam-bt` | Bluetooth menu used by `dam` |
| `Arch/local/bin/dam-media` | Media/volume menu used by `dam` |
| `Arch/local/bin/ime-run` | Runs GUI apps with fcitx5 environment variables |
| `Arch/local/bin/river-helpers` | Tags, wallpaper, notification and keybinding helpers |
| `Arch/fuzzel/fuzzel.ini` | Launcher/menu theme (also used by `dam-bt` and `dam-media`) |

`setup-links.sh` links the five scripts into `~/.local/bin`.

> `dam` itself is a small C status bar and is **not** vendored in this repo. Build it from [codeberg.org/sewn/dam](https://codeberg.org/sewn/dam) and install the binary as `~/.local/bin/dam`. Dependencies: `wayland`, `wayland-protocols`, `fcft`, `pixman`, `pkg-config`.
>
> `bemenu` has no config file here: it is only invoked with command-line flags for clipboard history and `river-helpers`. The default launcher is `fuzzel`.

<center>
    <img src="./pics/s1.png" alt="river after configuration">
    <p>The River desktop with dam after configuration</p>
</center>

<center>
    <img src="./pics/s2.png" alt="">
    <p>Overview of River </p>
</center>

## 6. Deployment

```bash
git clone --recurse-submodules git@github.com:KeithMalarkey/Arch-dots.git
cd Arch-dots
bash Arch/setup-links.sh        # ~/.config, shell dotfiles, ~/.local/bin scripts
bash Arch/install-bash-it.sh    # bash-it at a pinned commit + custom aliases
```

`install-bash-it.sh` keeps the upstream bash-it clone in `~/.bash_it` (not in this repo) and only stores the overlay under `Arch/bash_it/`.

## Reference

+ River
    + https://wiki.archlinux.org/title/River-classic
    + https://codeberg.org/river/river-classic
+ Niri
    + https://github.com/niri-wm/niri
+ Silent SDDM
    + https://github.com/uiriansan/SilentSDDM
+ Noctalia
    + https://noctalia.dev/shell
+ dam
    + https://codeberg.org/sewn/dam
+ bash-it
    + https://github.com/Bash-it/bash-it
+ ble.sh (optional)
    + https://github.com/akinomyoga/ble.sh
