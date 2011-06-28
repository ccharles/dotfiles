#!/bin/sh

if [[ "$1" == "awesome" ]]
then
    gnome-keyring-daemon &
    nm-applet --sm-disable &
    parcellite &
    batti &
    xcompmgr &
    /home/chris/bin/xorg.sh &
    dropboxd &
    ssh-agent ck-launch-session awesome
elif [[ "$1" == "gnome" ]]
then
    ck-launch-session gnome-session
elif [[ "$1" == "kde" ]]
then
    ck-launch-session startkde
fi
