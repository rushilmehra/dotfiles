if status is-interactive
    # Commands to run in interactive sessions can go here
end

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

# vim keybinds
fish_hybrid_key_bindings

# aliases
alias vim="nvim"
alias ls="ls -laG"

set PATH /home/rmehra/lua-language-server/bin/ $PATH
set PATH /home/rmehra/.cargo/bin $PATH
set PATH /home/rmehra/go/bin/ $PATH
starship init fish | source
