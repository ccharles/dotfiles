#!/bin/sh

LAST_DESKTOP_FILE="$HOME/.last-desktop"
DEFAULT_DESKTOP="i3"  # Fallback


# If we're not given a desktop, try to load the previous one
if [ -z "$1" ]; then
    if [ -e "$LAST_DESKTOP_FILE" ]; then
        DESKTOP=`cat "$LAST_DESKTOP_FILE"`
    fi
    [ -z "$DESKTOP" ] && DESKTOP="$DEFAULT_DESKTOP"
else
    DESKTOP="$1"
fi


# Save this desktop for next time
echo "$DESKTOP" > "$LAST_DESKTOP_FILE"


# Actual inits
if [[ "$DESKTOP" == "awesome" || "$DESKTOP" == "i3" ]]
then
    gnome-keyring-daemon &
    parcellite &
    batti &
    xcompmgr &
    $HOME/.scripts/xorg.sh &
    dropboxd &
    sparkleshare start &
    kmix &
    $HOME/.scripts/background.sh &
    numlockx &
    ssh-agent ck-launch-session "$DESKTOP"
elif [[ "$DESKTOP" == "gnome" ]]
then
    ck-launch-session gnome-session
elif [[ "$DESKTOP" == "kde" ]]
then
    ck-launch-session startkde
fi
