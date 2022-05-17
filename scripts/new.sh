#!/bin/bash
sudo rm -r ~/.dwm
sudo rm -r ~/dmenu
sudo rm -r ~/dwm
sudo rm -r ~/scripts
sudo rm -r ~/slstatus
sudo rm -r ~/st
sudo rm -r ~/surf
sudo rm -r ~/tabbed
sudo rm -r ~/.zshrc
sudo rm -r ~/README.md
sudo rm -r .config/picom.conf
sudo rm -r ~/.config/nvim

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
sudo rm -r custom_programs
