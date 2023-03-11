#!/bin/sh


if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

clean_up(){
    
    echo "Removing files if needed..."
    [ -d "/home/anton/custom_programs" ] && rm -r /home/anton/custom_programs;
    [ -d "/tmp/dwm" ] && rm -r /tmp/dwm;
    [ -d "/tmp/st" ] && rm -r /tmp/st;
    [ -d "/tmp/dmenu" ] && rm -r /tmp/dmenu;
    [ -d "/tmp/slstatus" ] && rm -r /tmp/slstatus;
    [ -d "/home/anton/.config/nvim" ] && rm -r /home/anton/.config/nvim
    [ -d "/home/anton/scripts" ] && rm -r /home/anton/scripts
    echo "Files removed!"
}

git_clone() {

    echo "Cloning repo and moving files..."
    git clone -q https://github.com/AntonGashi/custom_programs.git &&
    mv -f custom_programs/dwm /tmp
    mv -f custom_programs/st /tmp
    mv -f custom_programs/dmenu /tmp
    mv -f custom_programs/slstatus /tmp
    mv -f custom_programs/nvim /home/anton/.config
    mv -f custom_programs/scripts /home/anton
    echo "Cloned and moved!"

}

make_install() {

    echo "Making and installing programs..."
    make -C /tmp/dwm/ && make install -C /tmp/dwm/ || (echo "Failed to install dwm" && false)
    make -C /tmp/st/ && make install -C /tmp/st/ || (echo "Failed to install st" && false)
    make -C /tmp/dmenu/ && make install -C /tmp/dmenu/ || (echo "Failed to install dmenu" && false)
    make -C /tmp/slstatus/ && make install -C /tmp/slstatus/ || (echo "Failed to install slstatus" && false)
    echo "Programs installed"

}

clean_up && git_clone && make_install || echo "install failed"
rm -r /home/anton/custom_programs
