#!/bin/zsh

CHAR_FILE="$HOME/scripts/chars.csv"
local -a arr_csv 

while IFS= read -r line 
do
    arr_csv+=("${line//,/ }")
done < $CHAR_FILE

SELECTION=$(cat $CHAR_FILE | sed 's/,/  /g' | rofi -font "Fira Code NerdFont 30" -dmenu)
CLIP=${SELECTION:0:1}

printf $CLIP" " | xclip -selection clipboard 
dunstify "Copied $CLIP into clipboard" -t 3000


