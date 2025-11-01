echo ""
echo_i ":: setting up sddm"

echo_g ":: ensuring sddm config dir exists"
sudo mkdir -p /etc/sddm.conf.d

echo_g ":: setting up sddm autologin"
if [ ! -f /etc/sddm.conf.d/autologin.conf ]; then
  cat <<EOF | sudo tee /etc/sddm.conf.d/autologin.conf
[Autologin]
User=$USER
Session=hyprland-uwsm

[Theme]
Current=breeze
EOF
fi

echo_g ":: enabling sddm service"
sudo systemctl enable sddm.service

echo_s ":: sddm set up"
