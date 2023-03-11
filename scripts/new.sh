#!/bin/sh


if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

clean_up(){
    
    echo "Removing files if needed..."
    [ -d "/home/$USER/custom_programs" ] && rm -r /home/$USER/custom_programs;
    [ -d "/home/$USER/dwm" ] && rm -r /home/$USER/dwm;
    [ -d "/home/$USER/st" ] && rm -r /home/$USER/st;
    [ -d "/home/$USER/dmenu" ] && rm -r /home/$USER/dmenu;
    [ -d "/home/$USER/slstatus" ] && rm -r /home/$USER/slstatus;
    [ -d "/home/$USER/.config/nvim" ] && rm -r /home/$USER/.config/nvim
    echo "Files removed!"
}

git_clone() {

    echo "Cloning repo and moving files..."
    git clone -q https://github.com/AntonGashi/custom_programs.git
    mv -f /home/$USER/custom_programs/dwm /home/$USER/
    mv -f /home/$USER/custom_programs/st /home/$USER/
    mv -f /home/$USER/custom_programs/st /home/$USER/
    mv -f /home/$USER/custom_programs/st /home/$USER/
    echo "Cloned and moved!"

}

make_install() {

    echo "Making and installing programs..."
    make -C dwm/ && make install -C dwm/ || (echo "Failed to install dwm" && false)
    make -C st/ && make install -C st/ || (echo "Failed to install st" && false)
    make -C dmenu/ && make install -C dmenu/ || (echo "Failed to install dmenu" && false)
    make -C slstatus/ && make install -C slstatus/ || (echo "Failed to install slstatus" && false)
    echo "Programs installed"

}

clean_up && git_clone && make_install || echo "install failed"
rm -r /home/$USER/custom_programs
