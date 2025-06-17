#!/bin/bash

# Récupérer l'état mute du micro via wpctl (ou pactl)
STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ 2>/dev/null || pactl get-source-mute @DEFAULT_SOURCE@)

if echo "$STATUS" | grep -q '\[MUTED\]'; then
    echo " "   # icône micro coupé (FontAwesome)
    exit 0
else
    echo " "   # icône micro actif
    exit 0
fi

