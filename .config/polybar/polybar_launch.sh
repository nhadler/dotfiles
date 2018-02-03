#!/bin/bash 
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload dock &
  done
else
  polybar --reload dock &
fi
