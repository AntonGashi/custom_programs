#!/bin/sh

fzf_input=$(fzf -m --margin 5,5% --preview="head -$LINES {}" --reverse --prompt="FILE_SEARCH::" --pointer="->" --color="16")

xdg-open $fzf_input
