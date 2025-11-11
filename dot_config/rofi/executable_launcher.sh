#!/usr/bin/env bash

# My tinkering of adi1090x's theme
# Credit : Aditya Shakya (adi1090x)
# There is currently only one style

dir="$HOME/.config/rofi/themes/"
theme='rose-pine'

# Run
rofi \
  -show drun \
  -theme ${dir}/${theme}.rasi
