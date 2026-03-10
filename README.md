# Frosted Glass Hyprland Dots

A minimalist, modern, and "frosted glass" inspired dotfiles configuration for Hyprland, tailored for Fedora Linux. 

This repository contains the configuration files required to replicate a clean, dark-themed desktop environment with square borders, unified blur effects, and a highly modular architecture.

---

## Why This Setup Exists

Finding a balance between a feature-rich desktop and a visually calm workspace can be difficult. This configuration addresses that by:
* Enforcing a strict minimalist, dark, and frosted glass aesthetic across all UI elements.
* Keeping the Hyprland configuration highly modular for easy debugging and scaling.
* Utilizing lightweight tools like `eww` and `rofi` to create custom, beautiful control centers and launchers without bloating the system.

---

## Key Features

* **Window Manager:** Hyprland with square borders and optimized blur/transparency rules.
* **Bar:** Waybar customized with a minimal footprint and custom SVG icons.
* **Launcher:** Rofi styled to match the semi-transparent, frosted glass theme.
* **Control Center:** Eww (Elkowar's Wacky Widgets) for quick access to Wi-Fi, Bluetooth, brightness, and volume controls.
* **Dock:** `nwg-dock-hyprland` for a subtle, macOS-like bottom dock.
* **Notifications:** Dunst configured to blend seamlessly with the dark aesthetic.

---

## Project Structure

```text
dotfiles/
│
├── .config/
│   ├── dunst/
│   │   └── dunstrc
│   ├── eww/
│   │   ├── assets/
│   │   ├── scripts/
│   │   ├── eww.scss
│   │   └── eww.yuck
│   ├── hypr/
│   │   ├── scripts/
│   │   ├── autostart.conf
│   │   ├── bindings.conf
│   │   ├── env.conf
│   │   ├── hyprland.conf
│   │   ├── hyprpaper.conf
│   │   ├── input.conf
│   │   ├── lookandfeel.conf
│   │   ├── monitor.conf
│   │   ├── permissions.conf
│   │   ├── programs.conf
│   │   ├── window.conf
│   │   └── winrulev2.conf
│   ├── nwg-dock-hyprland/
│   │   ├── launch.sh
│   │   └── style.css
│   ├── rofi/
│   │   └── config.rasi
│   └── waybar/
│       ├── icons/
│       ├── scripts/
│       ├── config.jsonc
│       └── style.css
│
├── dependencies.txt
└── README.md
```

---

## Component Overview
* **hypr**: The core window manager configuration. It is split into logical modules (autostart.conf, bindings.conf, lookandfeel.conf, etc.) to keep the main hyprland.conf clean. Custom bash scripts handle specialized window behaviors like floating toggles and window minimization.
* **eww**: Powers the custom control center widget. Contains .yuck layout files, .scss styling, and shell scripts to fetch and toggle system states (Wi-Fi, Bluetooth, Audio).
* **waybar**: The main status bar at the top of the screen. It relies heavily on a custom directory of .svg icons to maintain a minimal, text-light appearance.
* **rofi**: The application launcher. Configured with a config.rasi file to ensure the background blur and dark theme perfectly match the terminal and Eww widgets.
* **nwg-dock-hyprland**: A simple application dock positioned at the bottom of the screen, styled via CSS to match the border and transparency rules of the overall system.

---

## Installation
### Prerequisites
Ensure you have your base system running with Hyprland installed. A list of all required packages and fonts can be found in dependencies.txt.

### Setup
Clone the repository:

```Bash
git clone https://github.com/Ayaanfaisaall/Hyprland-dotfiles.git
cd Hyprland-dotfiles
```

### Install Dependencies:
Review and install the packages listed in dependencies.txt using your package manager (e.g., dnf for Fedora).

### Deploy Configurations:
Backup your existing .config directories, then copy the contents of this repository to your local .config folder:

```Bash
cd Hyprland-dotfiles/.config
stow -t ~/.config .
```

### Make Scripts Executable:
Ensure all bash scripts in the hypr/scripts, eww/scripts, and nwg-dock-hyprland directories have execute permissions:

```Bash
chmod +x ~/.config/hypr/scripts/*.sh
chmod +x ~/.config/eww/scripts/*.sh
```

### Reload:
Restart Hyprland or use your defined keybind to reload the configuration.

## License
No License.
