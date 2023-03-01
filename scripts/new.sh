#!/bin/sh


if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

if [ -z "$1" ]; then
	echo "Provide your user"
	echo "Example: curl -sL [URL] | doas sh -s mike"
	exit 1
fi

clean_up() {
  rm -rf ~/dwm ~/dmenu ~/.dwm ~/scripts ~/slstatus ~/st ~/.config/nvim && \
  rm ~/.config/picom.conf
}

clone_repo() {
  git clone --quiet git@github.com:AntonGashi/custom_programs.git && \
  mv -f ~/custom_programs/.dwm ~/ && \
  mv -f ~/custom_programs/dmenu ~/ && \
  mv -f ~/custom_programs/dwm ~/ && \
  mv -f ~/custom_programs/scripts ~/ && \
  mv -f ~/custom_programs/slstatus ~/ && \
  mv -f ~/custom_programs/st ~/ && \
  mv -f ~/custom_programs/picom.conf ~/.config && \
  mv -f ~/custom_programs/nvim ~/.config || \
  (echo "Repo cloning failed" && false)
}

compile_install() {
  make -C dwm/ && make install -C dwm/ || (echo "Failed to install dwm" && false) && \
  make -C st/ && make install -C st/ || (echo "Failed to install st" && false) && \
  make -C dmenu/ && make install -C dmenu/ || (echo "Failed to install dmenu" && false) && \
  make -C slstatus/ && make install -C slstatus/ || (echo "Failed to install slstatus" && false) && \

}

clean_up && clone_repo && compile_install && \
echo "Successfully installed custom_programs" && \
echo "Restart machine" || \
(echo "Installation failed" && exit 1)
