#!/usr/bin/env bash

# Cierra instancias viejas
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lanza solo la barra "main"
polybar --reload main &
