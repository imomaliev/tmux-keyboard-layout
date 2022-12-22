#!/bin/bash
set -euo pipefail


if [ "$(uname)" = "Linux" ]; then
    xkblayout
elif [ "$(uname)" = "Darwin" ]; then
    defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep "KeyboardLayout Name" | cut -f 2 -d "=" | tr -d ' ;."'
fi
