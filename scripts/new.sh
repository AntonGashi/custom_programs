#!/bin/sh


if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

clean_up(){
    
    echo -e "####\nRemoving files if needed...\n####"
    [ -d "/home/$SUDO_USER/custom_programs" ] && rm -r /home/$SUDO_USER/custom_programs;
    [ -d "/home/$SUDO_USER/dwm" ] && rm -r /home/$SUDO_USER/dwm;
    [ -d "/home/$SUDO_USER/st" ] && rm -r /home/$SUDO_USER/st;
    [ -d "/home/$SUDO_USER/dmenu" ] && rm -r /home/$SUDO_USER/dmenu;
    [ -d "/home/$SUDO_USER/slstatus" ] && rm -r /home/$SUDO_USER/slstatus;
    [ -d "/home/$SUDO_USER/scripts" ] && rm -r /home/$SUDO_USER/scripts
    echo -e "####\nFiles removed!!!\n####"
}

git_clone() {

    echo -e "####\nCloning repo and moving files...\n####"
    git clone -q https://github.com/AntonGashi/custom_programs.git &&
    mv -f /home/$SUDO_USER/custom_programs/dwm /home/$SUDO_USER
    mv -f /home/$SUDO_USER/custom_programs/st /home/$SUDO_USER
    mv -f /home/$SUDO_USER/custom_programs/dmenu /home/$SUDO_USER
    mv -f /home/$SUDO_USER/custom_programs/slstatus /home/$SUDO_USER
    mv -f /home/$SUDO_USER/custom_programs/scripts /home/$SUDO_USER
    echo -e "####\nCloned and moved!!!\n####"

}

make_install() {

    echo -e "####\nMaking and installing programs...\n####"
    make install --silent --directory="/home/$SUDO_USER/dwm/" || (echo "Failed to install dwm" && false)
    make install --silent --directory="/home/$SUDO_USER/st/" || (echo "Failed to install st" && false)
    make install --silent --directory="/home/$SUDO_USER/dmenu/" || (echo "Failed to install dmenu" && false)
    make install --silent --directory="/home/$SUDO_USER/slstatus/" || (echo "Failed to install slstatus" && false)
    echo -e "####\nPrograms installed!!!\n####"

}

clean_up && git_clone && make_install || echo "install failed"
rm -r /home/$SUDO_USER/custom_programs
