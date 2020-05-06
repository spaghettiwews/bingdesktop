#!/bin/bash

url=$(curl -s "https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US" | jq -r '"https://www.bing.com" + .images[0].url')
img=$(echo ${url%%&*}) && img=$(echo ${img#*=})
cd ~ && homepath=$(pwd)
mkdir -p $homepath/Pictures/wallpapers && wget -q $url -O ~/Pictures/wallpapers/$img && gsettings set org.gnome.desktop.background picture-uri "file://${homepath}/Pictures/wallpapers/${img}" &&
echo "${homepath}/Pictures/wallpapers/${img} has been set as your desktop background" &&
exit 0