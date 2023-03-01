#!/bin/sh


if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

mv -f ~/custom_programs/.dwm ~/
mv -f ~/custom_programs/dmenu ~/
mv -f ~/custom_programs/dwm ~/ 
mv -f ~/custom_programs/scripts ~/
mv -f ~/custom_programs/slstatus ~/
mv -f ~/custom_programs/st ~/
mv -f ~/custom_programs/surf ~/
mv -f ~/custom_programs/tabbed ~/
mv -f ~/custom_programs/.zshrc  ~/
mv -f ~/custom_programs/README.md ~/
mv -f ~/custom_programs/picom.conf ~/.config
mv -f ~/custom_programs/nvim ~/.config
rm -r custom_programs

make -C dwm/ && make install -C dwm/ || (echo "Failed to install dwm" && false) && \
make -C st/ && make install -C st/ || (echo "Failed to install st" && false) && \
make -C dmenu/ && make install -C dmenu/ || (echo "Failed to install dmenu" && false) && \
make -C slstatus/ && make install -C slstatus/ || (echo "Failed to install slstatus" && false) && \

echo "Successfully installed custom_programs" && \
echo "Restart machine" || \
(echo "Installation failed" && exit 1)
