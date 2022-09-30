#!/bin/bash
set -euo pipefail

#---
## Returns stream of selected input sources
#---
getInputSrc() {
  defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources
} 

{
  # gets the `keyboard layout name`
  getInputSrc | grep 'KeyboardLayout Name' | cut -f 2 -d '=' | tr -d ' ;.\"'
} || {
  # gets the `input method` if `keyboard layout name` not exists
  inputMethod=$(getInputSrc | egrep -w 'Input Mode.*inputmethod')
  echo ${inputMethod#*'inputmethod.'} | cut -f 1 -d "." | tr -d '";'
}
