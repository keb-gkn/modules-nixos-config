if status is-interactive
    # Commands to run in interactive sessions can go here
end

fastfetch

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

fish_ssh_agent

# Created by `pipx` on 2023-08-11 12:51:49
set PATH $PATH $HOME/.local/bin
