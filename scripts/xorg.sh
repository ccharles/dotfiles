#!/bin/bash

# Silence!
xset -b

# Caps lock as extra Ctrl
xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Control_L"
xmodmap -e "add Control = Control_L"

# Pause as Compose key
xmodmap -e "keysym Pause = Multi_key"
