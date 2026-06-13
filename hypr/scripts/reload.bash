#!/usr/bin/bash

killall noctalia hyprpaper hypridle
hyprctl reload
hyprpaper &
hypridle &
noctalia &
