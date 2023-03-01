#!/bin/sh


if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root"
    exit 1
fi


make -C dwm/ && make install -C dwm/ || (echo "Failed to install dwm" && false) && \
make -C st/ && make install -C st/ || (echo "Failed to install st" && false) && \
make -C dmenu/ && make install -C dmenu/ || (echo "Failed to install dmenu" && false) && \
make -C slstatus/ && make install -C slstatus/ || (echo "Failed to install slstatus" && false) && \

echo "Successfully installed custom_programs" && \
echo "Restart machine" || \
(echo "Installation failed" && exit 1)
