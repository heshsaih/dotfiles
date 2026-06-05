#!/usr/bin/bash

killall qs hyprpaper hypridle
hyprctl reload
hyprpaper &
hypridle &
qs -c noctalia-shell > $HOME/.noctalia.log &
