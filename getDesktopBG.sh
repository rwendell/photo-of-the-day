#!/bin/bash

file_name="$(date '+%m-%d-%Y').jpg"
#changed the location of the url_image for better use with i3
url_image=$(node $HOME/.config/nat-grab/index.js)

# Verify if node returns
if [[ $? -ne 0 ]] ; then echo "Error: request falure" && exit 1 ; fi

# Create the `images/` folder, if it can
if [ ! -d "$HOME/media/wallpapers" ] ; then mkdir -p "$HOME/media/wallpapers" || exit 1 ; fi

# Download the 'Photo Of The Day'
wget $url_image -O "$HOME/media/wallpapers/${file_name}" || { echo 'Imposible to download file' && exit 2; }

# Uses feh to set the background
feh --bg-scale $HOME/media/wallpapers/${file_name}
