echo ""
echo_i ":: installing yay"

if sudo pacman -Qs yay; then
    echo_s ":: yay is already installed!"
else
    temp_path=$PWD
    echo_g ":: cloning yay.git into temporary location at ~/yay-git"
    git clone https://aur.archlinux.org/yay.git ~/yay-git
    cd ~/yay-git || exit
    echo_g ":: running makepkg -si"
    makepkg -si
    cd "$temp_path" || exit
    echo_g ":: removing temporary git repo"
    rm -rf ~/yay-git
    echo_s ":: yay installed successfully"
fi


