if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x PATH $PATH /opt/nvim-linux-x86_64/bin

set -gx PNPM_HOME "/home/pedro/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end

set -x PATH $PATH /home/pedro/.config/herd-lite/bin

set -x PATH $PATH /home/pedro/.local/bin
set -x PATH $PATH /usr/local/go/bin

zoxide init fish | source

source ~/.config/fish/functions/docker.fish
