if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting ""
    starship init fish | source
end
set -gx PATH "$HOME/.local/bin" $PATH
