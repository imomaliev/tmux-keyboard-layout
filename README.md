# Tmux Keyboard Layout plugin

Plugin that shows current keyboard layout.

### Usage

```tmux.conf
set -g status-right '#{keyboard_layout}'
```

### Installation with Tmux Plugin Manager (recommended)

Add plugin to the list of TPM plugins:

```tmux.conf
set -g @plugin 'imomaliev/tmux-keyboard-layout'
```

Press prefix + I to install it.

### Manual Installation

Clone the repo:

```bash
$ git clone https://github.com/imomaliev/tmux-keyboard-layout.git ~/clone/path
```

Add this line to your .tmux.conf:

```tmux.conf
run-shell ~/clone/path/tmux-keyboard-layout.tmux
```

Reload TMUX environment with:

```bash
$ tmux source-file ~/.tmux.conf
```

### Configurations

#### Set layout on per session scope

Follows same rules as `set-option`

For example to set for session scope

```tmux.conf
set -g @keyboard_layout:option_scope ''
```

#### Make output shorter

For example make output length equal to 2

```tmux.conf
set -g @keyboard_layout:length 2
```

### License

[MIT](LICENSE)
