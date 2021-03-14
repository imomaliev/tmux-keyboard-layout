#!/usr/bin/env bash

set -euo pipefail

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Place holder for status left/right
place_holder="\#{keyboard_layout}"

keyboard_layout="#($CURRENT_DIR/scripts/get_keyboard_layout.sh)"

interpolate() {
    local -r status="$1"
    local -r option_value=$(tmux show-option -sqv "$status")
    tmux set-option -sq "$status" "${option_value/$place_holder/$keyboard_layout}"
}

main() {
    interpolate "status-left"
    interpolate "status-right"
}

main
