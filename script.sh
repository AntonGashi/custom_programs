#!/bin/sh

choices="computational\nproject\nquantum\nsolid state\ntheoretical"

chosen=$(echo -e "$choices" | dmenu -i)

case "$chosen" in
  computational) cd Desktop/uni/fourth\ year/classes/Computational\ And\ Complex\ Systems/ && ranger;;
  project) cd Desktop/uni/fourth\ year/classes/project && ranger;;
  quantum) cd Desktop/uni/fourth\ year/classes/Quantum\ Optics/ && ranger;;
  "solid state") cd Desktop/uni/fourth\ year/classes/Solid\ State/ && ranger;;
  theoretical) cd Desktop/uni/fourth\ year/classes/Theoretical\ Physics/ && ranger;;
esac
