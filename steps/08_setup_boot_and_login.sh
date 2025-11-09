echo ""
echo_i ":: setting up limine and automatic login and snapshots"

echo_g ":: grabbing limine config path"
# grab limine config path
if [[ -f /boot/EFI/BOOT/limine.conf ]]; then
  limine_config="/boot/EFI/BOOT/limine.conf"
elif [[ -f /boot/EFI/limine/limine.conf ]]; then
  limine_config="/boot/EFI/limine/limine.conf"
else
  limine_config="/boot/limine.conf"
fi
if [[ ! -f $limine_config ]]; then
  shitpost_error "limine config file not found, get outta me swamp"
fi

echo_g ":: grabbing default limine cmdline"
CMDLINE=$(grep "^[[:space:]]*cmdline:" "$limine_config" | head -1 | sed 's/^[[:space:]]*cmdline:[[:space:]]*//')

# overwrite limine config with our own, adding quiet splash and a hyprkiss unified kernel image
# as well as a fallback bootloader and snapshots
echo_g ":: overwriting limine config"
sudo tee /etc/default/limine <<EOF >/dev/null
TARGET_OS_NAME="Hyprkiss"

ESP_PATH="/boot"

KERNEL_CMDLINE[default]="$CMDLINE"
KERNEL_CMDLINE[default]+="quiet splash"

ENABLE_UKI=yes
CUSTOM_UKI_NAME="hyprkiss"

ENABLE_LIMINE_FALLBACK=yes

# Find and add other bootloaders
FIND_BOOTLOADERS=yes

BOOT_ORDER="*, *fallback, Snapshots"

MAX_SNAPSHOT_ENTRIES=5

SNAPSHOT_FORMAT_CHOICE=5
EOF

# set up styled limine config and defaults, limine update will take care of the rest
echo_g ":: overwriting limine.conf"
sudo tee /boot/limine.conf <<EOF >/dev/null
### Read more at config document: https://github.com/limine-bootloader/limine/blob/trunk/CONFIG.md
#timeout: 3
default_entry: 2
interface_branding: Hyprkiss Boot
interface_branding_color: 2
hash_mismatch_panic: no

term_background: 1a1b26
backdrop: 1a1b26

# Terminal colors (Tokyo Night palette)
term_palette: 15161e;f7768e;9ece6a;e0af68;7aa2f7;bb9af7;7dcfff;a9b1d6
term_palette_bright: 414868;f7768e;9ece6a;e0af68;7aa2f7;bb9af7;7dcfff;c0caf5

# Text colors
term_foreground: c0caf5
term_foreground_bright: c0caf5
term_background_bright: 24283b

EOF
 
# Remove the original config file
if  [[ -f "$limine_config" ]]; then
    echo_g ":: removing original limine config"
    sudo rm "$limine_config"
fi

echo_s ":: limine config set up"
