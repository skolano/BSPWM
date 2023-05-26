#!/bin/bash
#
#   Lockscreen script
#   Requirements:
#       - i3lock
#       - scrot
#       - imagemagick
#
IMAGE=~/.config/bspwm/lock/sko.png
IMAGE_BLUR=~/.config/bspwm/lock/sko-blur.png
rm -f $IMAGE $IMAGE_BLUR

scrot $IMAGE
convert $IMAGE  -brightness-contrast -20 -filter Gaussian -blur 0x5  $IMAGE_BLUR
i3lock -i $IMAGE_BLUR
