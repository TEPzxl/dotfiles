if status is-interactive
    starship init fish | source
end

# PATH
set PATH $PATH /home/tep/.local/bin

# Vim mode
set -g fish_key_bindings fish_vi_key_bindings

# 光标模式
set -U fish_cursor_default block
set -U fish_cursor_insert line
set -U fish_cursor_replace underscore
set -U fish_cursor_visual block

# 模式提示
function fish_mode_prompt
    switch $fish_bind_mode
        case insert
            set_color green
            echo -n "INSERT "
        case replace
            set_color yellow
            echo -n "REPLACE "
        case visual
            set_color magenta
            echo -n "VISUAL "
        case '*'
            set_color red
            echo -n "NORMAL "
    end
    set_color normal
end

set -g fish_escape_delay_ms 10

source /usr/share/doc/fzf/examples/key-bindings.fish


set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS "@im=fcitx"

# fnm initialization
fnm env --use-on-cd | source

# ---- pyenv ----
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
pyenv init - | source

# ---- zoxide ----
zoxide init fish | source

if test -f ~/.config/fish.secret.fish
    source ~/.config/fish.secret.fish
end

# add go path
fish_add_path $HOME/go/bin

# Add quick execute the last command abbreviation
function last_history_item
    echo $history[1]
end

abbr -a !! --position anywhere --function last_history_item


if status is-interactive
    # 只有当不在 VS Code 终端里，且当前是家目录时，才跳转
    # $TERM_PROGRAM 在 VS Code 里会被设置为 'vscode'
    if test "$TERM_PROGRAM" != "vscode"; and test "$PWD" = "$HOME"
        cd /home/tep/dev
    end
end

kubectl completion fish | source
