#!/bin/bash

# Bascule le mute du micro
wpctl set-mute @DEFAULT_SOURCE@ toggle
# Récupère l'état après bascule
MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q MUTED && echo "Muted" || echo "Unmuted")


