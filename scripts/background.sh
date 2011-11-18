#!/bin/bash


LAST_BACKGROUND_FILE="$HOME/.last-background"


if [ -z "$1" ]; then
    if [ -e "$LAST_BACKGROUND_FILE" ]; then
        BACKGROUND=`cat "$LAST_BACKGROUND_FILE"`
    fi
else
    BACKGROUND="$1"
fi


echo "$BACKGROUND" > "$LAST_BACKGROUND_FILE"


[ -z "$BACKGROUND" ] || feh --bg-fill "$BACKGROUND"
