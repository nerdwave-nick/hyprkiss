echo ""
echo_i ":: setting up plymouth"

if [ "$(plymouth-set-default-theme)" != "hyprkiss" ]; then
  sudo cp -r "$HYPRKISS_PATH/data/plymouth" /usr/share/plymouth/themes/hyprkiss/
  sudo plymouth-set-default-theme hyprkiss
fi

echo_s ":: plymouth set up"
