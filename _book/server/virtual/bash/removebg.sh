#!/bin/bash

echo -e "enter your img \c"

read myimg

myapi="JRx4PP2fjDAevUt1sEXh92sX"
bgurl="https://api.remove.bg/v1.0/removebg"
imgpath="/root/"

curl -H 'X-API-Key: ${mypai}'                   \
    -F 'image_file=@'$imgpath$myimg             \
    -F 'size=auto'                              \
    -f $bgurl -o no-bg.png
