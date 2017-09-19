

Xfce4 Version: 4.12
Xfce4 Source: http://archive.xfce.org/

This source was built especially for those who want to use the latest version of xfce4 with the pulseaudio or audio jack.

Requirements:
- slackware64 14.2
- pulseaudio or audio jack

Contents:
- xarchiver
- dmz-cursor
- gnome icon
- greybird theme
- mousepad
- ristretto
- thunar plugins
- sensors plugins (inclusing nvidia sensors)

How to install:
- you need to download the .zip or clone git and then run the script
sh build-xfce-pulse.sh (for pulseaudio)
sh build-xfce-jack.sh (for jack audio)

If you prefer to use the pavucontrol to control the pulseaudio, simply remove the xfce4-mixer and then build the pavucontrol (already contains the source)
