if status is-interactive
    # Commands to run in interactive sessions can go here
end

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

# vim keybinds
fish_hybrid_key_bindings

# aliases
alias vim="nvim"
alias ls="ls -laG"

starship init fish | source
