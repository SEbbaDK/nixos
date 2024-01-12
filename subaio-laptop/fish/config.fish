if status is-interactive
    # Commands to run in interactive sessions can go here
    bind \e\[100\;9u 'set TARGET (dir) ; [ "$TARGET" != "" ] && cd "$TARGET"'
    bind \e\[102\;9u 'f ~'
    bind \e\[102\;10u 'f ./'
end

source /home/sebastian.hyberts/.nix-profile/etc/profile.d/nix.fish

set fish_greeting

export EDITOR=kak
export SSH_AUTH_SOCK=/run/user/1001/keyring/ssh
export GNOME_KEYRING_CONTROL=/run/user/1001/keyring/control
export XDG_CURRENT_DESKTOP=sway

