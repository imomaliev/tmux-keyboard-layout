#!/usr/bin/env bash

set -euo pipefail

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Place holder for status left/right
place_holder="\#{keyboard_layout}"

keyboard_layout_option_scope='@keyboard_layout:option_scope'
keyboard_layout_length='@keyboard_layout:length'
get_keyboard_layout="$CURRENT_DIR/scripts/get_keyboard_layout.sh"

interpolate() {
    local -r status="$1"
    local -r keyboard_layout=$2
    local -r option_scope="${3:-g}"
    local -r option_value=$(tmux show-option -"$option_scope"qv "$status")
    tmux set-option -"$option_scope"q "$status" "${option_value/$place_holder/$keyboard_layout}"
}

main() {
    local -r option_scope=$(tmux show-option -gqv "${keyboard_layout_option_scope}")
    local -r length=$(tmux show-option -gqv "${keyboard_layout_length}")
    # https://unix.stackexchange.com/a/3455
    local -r keyboard_layout="#($get_keyboard_layout | cut -c1-${length:-16})"
    interpolate "status-left" "$keyboard_layout" "$option_scope"
    interpolate "status-right" "$keyboard_layout" "$option_scope"
}

main
