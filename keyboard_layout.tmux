#!/usr/bin/env bash

set -euo pipefail

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Place holder for status left/right
place_holder="\#{keyboard_layout}"

keyboard_layout_option_scope='@keyboard_layout:option_scope'
keyboard_layout="#($CURRENT_DIR/scripts/get_keyboard_layout.sh)"

interpolate() {
    local -r status="$1"
    local -r _keyboard_layout_option_scope="$2"
    local -r option_value=$(tmux show-option -"$_keyboard_layout_option_scope"qv "$status")
    tmux set-option -"$_keyboard_layout_option_scope"q "$status" "${option_value/$place_holder/$keyboard_layout}"
}

main() {
    local -r _keyboard_layout_option_scope="$(tmux show-option -gqv "${keyboard_layout_option_scope:-g}")"
    interpolate "status-left" "$_keyboard_layout_option_scope"
    interpolate "status-right" "$_keyboard_layout_option_scope"
}

main
