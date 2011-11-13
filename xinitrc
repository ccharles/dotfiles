#!/bin/sh

if [[ "$1" == "awesome" || "$1" == "i3" ]]
then
    gnome-keyring-daemon &
    parcellite &
    batti &
    xcompmgr &
    /home/chris/.scripts/xorg.sh &
    dropboxd &
    sparkleshare start &
    kmix &
    ssh-agent ck-launch-session "$1"
elif [[ "$1" == "gnome" ]]
then
    ck-launch-session gnome-session
elif [[ "$1" == "kde" ]]
then
    ck-launch-session startkde
fi
