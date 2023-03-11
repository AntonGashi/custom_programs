#!/bin/sh


if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

clean_up(){
    
    echo "Removing files if needed..."
    [ -d "/home/$SUDO_USER/custom_programs" ] && rm -r /home/$SUDO_USER/custom_programs;
    [ -d "/home/$SUDO_USER/dwm" ] && rm -r /home/$SUDO_USER/dwm;
    [ -d "/home/$SUDO_USER/st" ] && rm -r /home/$SUDO_USER/st;
    [ -d "/home/$SUDO_USER/dmenu" ] && rm -r /home/$SUDO_USER/dmenu;
    [ -d "/home/$SUDO_USER/slstatus" ] && rm -r /home/$SUDO_USER/slstatus;
    [ -d "/home/$SUDO_USER/.config/nvim" ] && rm -r /home/$SUDO_USER/.config/nvim
    [ -d "/home/$SUDO_USER/scripts" ] && rm -r /home/$SUDO_USER/scripts
    echo "Files removed!!!"
}

git_clone() {

    echo "Cloning repo and moving files..."
    git clone -q https://github.com/AntonGashi/custom_programs.git &&
    mv -f /home/$SUDO_USER/custom_programs/dwm /home/$SUDO_USER
    mv -f /home/$SUDO_USER/custom_programs/st /home/$SUDO_USER
    mv -f /home/$SUDO_USER/custom_programs/dmenu /home/$SUDO_USER
    mv -f /home/$SUDO_USER/custom_programs/slstatus /home/$SUDO_USER
    mv -f /home/$SUDO_USER/custom_programs/nvim /home/$SUDO_USER/.config
    mv -f /home/$SUDO_USER/custom_programs/scripts /home/$SUDO_USER
    echo "Cloned and moved!!!"

}

make_install() {

    echo "Making and installing programs..."
    make -sC /home/$SUDO_USER/dwm/ && make install -sC /home/$SUDO_USER/dwm/ || (echo "Failed to install dwm" && false)
    make -sC /home/$SUDO_USER/st/ && make install -sC /home/$SUDO_USER/st/ || (echo "Failed to install st" && false)
    make -sC /home/$SUDO_USER/dmenu/ && make install -sC /home/$SUDO_USER/dmenu/ || (echo "Failed to install dmenu" && false)
    make -sC /home/$SUDO_USER/slstatus/ && make install -sC /home/$SUDO_USER/slstatus/ || (echo "Failed to install slstatus" && false)
    echo "Programs installed!!!"

}

clean_up && git_clone && make_install || echo "install failed"
rm -r /home/$SUDO_USER/custom_programs
