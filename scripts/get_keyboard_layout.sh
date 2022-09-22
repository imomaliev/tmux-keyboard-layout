#!/bin/bash
set -euo pipefail

{
  # gets the keyboard layout name
  defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep "KeyboardLayout Name" | cut -f 2 -d '=' | tr -d ' ;.\"'
} || {
  # get input mode if there is no keyboard layout name
  defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | egrep -w 'Input Mode.*inputmethod' | cut -f 2 -d "=" | rev | cut -d'.' -f 1 | rev | tr -d ' ;."'
}
