echo_i ":: updating limine"
sudo limine-update
echo_s "limine updated"

echo_i ":: removing default limine entries"
# grab the boot numbers for the default entries if any
bootnums=($(sudo efibootmgr | grep -E "^Boot[0-9]{4}\*? Arch Linux Limine" || : \
    | sed 's/^Boot\([0-9]\{4\}\).*/\1/'))

# go over each boot number and remove it
for num in "${bootnums[@]}"; do
    sudo efibootmgr -b "$num" -B
done

echo_s "default entries removed"
