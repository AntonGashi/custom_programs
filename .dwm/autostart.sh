#!/bin/bash

feh --bg-fill /home/anton/Pictures/Berlin.JPG;
xrandr --output DP-0 --mode 1920x1080 --rate 144.00;
picom & disown;
slstatus;
sudo pacman -Syyu
