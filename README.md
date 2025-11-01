# ARCH ISO SETTINGS

| Section                        | Option                                                                         |
| ------------------------------ | ------------------------------------------------------------------------------ |
| Disk configuration             | Default partitioning btrfs + use compression > LUKS compression > Snapper      |
| Bootloader                     | limine                                                                         |
| Applications > Audio           | pipewire                                                                       |
| Network configuration          | Copy ISO network config                                                        |
| Additional Packages            | git, curl                                                                      |

# INSTALLED PACKAGES

- bluez(bluetooth protocol)
- bluez-utils (ctl bluetooth stuff)
- brightnessctl (brightness control)
- ddcci driver (brightness control for external monitors)
- gnome-keyring (administrator prompter)
- gvfs-mtp (virtual file system dependancy)
- gvfs-smp (dvirtual file system dependancy)
- hypridle (idle manager)
- hyprland 
- hyprland-qtutils (dependancy graphical framework)
- hyprlock (lockscreen)
- hyprpicker (color picker tool/dependency)
- hyprshot (snipping tool)
- hyprsunset (blue light filter)
- inetutils (network utils ping ipconfig)
- iwd (wifi utlities)
- man (manual viewer)
- pamixer (audio cli)
- plymouth (splashscreen/booting)
- playerctl (audio command util)
- polkit-gnome ( authentication dpeendancy)
- qt5-wayland (dependancy)
- sddm (simple desktop display manager)
- ufw (firewall)
- ufw-docker (firewall)
- uwsm (wayland protocol)
- wf-recorder ( recorder screen)
- wiremix (volume mixer frontend)
- wireplumber (policy session manager)
- wl-clipboard (terminal clipboard for wayland)
- xdg-desktop-portal-gtk (depend)
- xdg-desktop-portal-hyprland (depeind)

# Full System?
You'll still need essentials! This is not a full modern system. 
> [!TIP]
> Check out [hyprfluff](https://github.com/nerdwave-nick/hyprfluff), our own spin on it
