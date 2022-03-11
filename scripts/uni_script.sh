#!/bin/sh

choices="computational\nproject\nquantum\nsolid state\ntheoretical\nsearch"

chosen=$(echo -e "$choices" | dmenu -i)

case "$chosen" in
  computational) cd Desktop/uni/fourth\ year/classes/Computational\ And\ Complex\ Systems/ && ranger;;
  project) cd Desktop/uni/fourth\ year/classes/project && ranger;;
  quantum) cd Desktop/uni/fourth\ year/classes/Quantum\ Optics/ && ranger;;
  "solid state") cd Desktop/uni/fourth\ year/classes/Solid\ State/ && ranger;;
  theoretical) cd Desktop/uni/fourth\ year/classes/Theoretical\ Physics/ && ranger;;
  search) cd Desktop/uni/fourth\ year/ && input=$(fzf -m --margin 5,5% --preview="head -$LINES {}" --reverse --prompt="FILE_SEARCH::" --pointer="->" --color="16") && xdg-open $input;;
esac
