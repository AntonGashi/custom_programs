#!/bin/sh

choices="numpy\nmatplotlib\nscipy"

chosen=$(echo -e "$choices" | dmenu -i)

case "$chosen" in 
  numpy) zathura "/home/anton/Desktop/uni/fourth year/classes/Computational And Complex Systems/docs/numpy_docs.pdf";;
  matplotlib) zathura "/home/anton/Desktop/uni/fourth year/classes/Computational And Complex Systems/docs/matplotlib_docs.pdf";;
  scipy) zathura "/home/anton/Desktop/uni/fourth year/classes/Computational And Complex Systems/docs/scipy_docs.pdf";;
esac
