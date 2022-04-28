#!/bin/sh

options="Desktop\nDownloads\nGo\nConfig"

chosen=$(echo -e "$options" | fzf)

case "$chosen" in 
  Desktop) cd Desktop && pick=$(fzf -m --margin 5,5% --preview="head -$LINES {}" --reverse --prompt="FILE_SEARCH::" --pointer="->" --color="16");;
  Downloads) cd Downloads && pick=$(fzf -m --margin 5,5% --preview="head -$LINES {}" --reverse --prompt="FILE_SEARCH::" --pointer="->" --color="16");;
  Go) cd go && pick=$(fzf -m --margin 5,5% --preview="head -$LINES {}" --reverse --prompt="FILE_SEARCH::" --pointer="->" --color="16");;
  Config) cd .config && pick=$(fzf -m --margin 5,5% --preview="head -$LINES {}" --reverse --prompt="FILE_SEARCH::" --pointer="->" --color="16");;

esac

xdg-open "$pick"
