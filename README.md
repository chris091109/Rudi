## Packages

### Core
| Package | Description |
|---------|-------------|
| firefox | Web browser |
| steam | Gaming platform |

### Development
| Package | Description |
|---------|-------------|
| git | Version control |
| python3 | Python runtime |
| nodePackages.prettier | Code formatter |

### Graphics / Vulkan
| Package | Description |
|---------|-------------|
| glfw | OpenGL window library |
| cglm | C graphics math library |
| vulkan-headers | Vulkan API headers |
| vulkan-loader | Vulkan loader |
| vulkan-tools | Vulkan utilities |
| vulkan-validation-layers | Vulkan debug layers |

### Qt / QML
`qt6.qtbase` `qt6.qtdeclarative` `qt6.qtsvg` `qt6.qtwayland` `qt6.qt5compat`

### Desktop
`blueman` `vlc` `thunar` `discord` `prismlauncher` `anki`

### Audio
`cava` `pavucontrol`

### System Tools
`htop` `btop` `fastfetch` `unzip` `zip` `p7zip` `grimblast` `wofi` `alacritty`

## Setup

```bash
# Clone the repo
git clone https://github.com/<your-username>/nixdots ~/.config/nixos

# Rebuild
sudo nixos-rebuild switch --flake .#<hostname>
```
