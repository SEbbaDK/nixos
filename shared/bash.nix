let
  user = import ../user.nix;
in
{
  programs.bash.promptInit = ''
    set_prompt() {
      SHELL_PS1="\e[1;30;43m$([ -n "$IN_NIX_SHELL" ] && if [ -n "$name" ]; then echo " $name "; else echo ' nix-shell '; fi)\e[m"
      USER_PS1="\e[1;30;41m $(whoami) \e[m"
      HOST_PS1="\e[1;30;45m $(cat /etc/hostname) \e[m"
      PATH_PS1="\e[1;30;42m $(pwd | sed "s#$HOME#~#g") \e[m"
      if command -v git &> /dev/null && [ -n "$(git rev-parse --is-inside-work-tree 2> /dev/null)" ]
      then
        CHANGES=$(git status -s | wc -l)
        ORIGIN=$(git remote | head -n 1)
        TAG=$(git describe --tag --exact-match 2>/dev/null)
        BRANCH=$(git branch --show-current)
        [ -z $BRANCH ] && BRANCH=$(git rev-parse HEAD | head -c 6)
        GIT_PS1="\e[1;30;44m $BRANCH "
        [ -n $TAG ] && GIT_PS1="$GIT_PS1$TAG ";
        GIT_PS1="$GIT_PS1$([ $CHANGES != 0 ] && echo "$CHANGES¤ ")"
        if git branch -r | grep -q "$ORIGIN/$BRANCH"
        then
          AHEAD_BEHIND=$(git rev-list --left-right --count "$BRANCH...$ORIGIN/$BRANCH")
          AHEAD=$(echo "$AHEAD_BEHIND" | grep -oP "^[0-9]+")
          BEHIND=$(echo "$AHEAD_BEHIND" | grep -oP "^[0-9]+	\K[0-9]+")
          GIT_PS1="$GIT_PS1$([ $AHEAD != 0 ] && echo "$AHEAD↑ ")"
          GIT_PS1="$GIT_PS1$([ $BEHIND != 0 ] && echo "$BEHIND↓ ")"
        else
          GIT_PS1="$GIT_PS1↟ "
        fi
        GIT_PS1="$GIT_PS1\e[m"
      else
        GIT_PS1=""
      fi
      echo -e "$SHELL_PS1$USER_PS1$HOST_PS1$PATH_PS1$GIT_PS1"
      PS1='\[\e[1m\]\$\[\e[m\] '
    }
    PROMPT_COMMAND=set_prompt
  '';

  home-manager.users.${user}.programs.bash = {
      enable = true;
      historyControl = [ "ignoredups" "ignorespace" ];
      historyIgnore = [ "ls" "cd" "r" "ranger" ];
      shellOptions = [ "histappend" "checkwinsize" ];
      sessionVariables = {
        GCC_COLORS = "error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01";
      };
      shellAliases = {
        ls = "ls --color=auto";
        ll = "ls -l";
        la = "ls -a";
        grep = "grep --color=auto";
        egrep = "egrep --color=auto";
        grin = "grep -rin";

        r = "source ranger";

        gl = "git log --oneline --graph --decorate --branches --remotes --tags --color=always | less -RS";
        gs = "git status";
        gc = "git commit -m";
        gps = "git push";
        gpl = "git pull";
        gd = "git diff";
        gb = "git checkout -b";
        gsw = "git switch";
        ga = "git add";
        gf = "git fetch";
        ghub = "git clone git@github.com:";

        yt-mp3 = "youtube-dl --extract-audio --audio-format mp3 --embed-thumbnail --add-metadata -o \"%(title)s.%(ext)s\"";

        "*clip" = "xclip";
        "*clipo" = "*clipo -o";
        "+clip" = "xclip -sel clip";
        "+clipo" = "+clip -o";

        nsh = "nix-shell";
        nsrch = "nix search";

        t = "todo.sh";

        snores = "sudo nixos-rebuild switch";
      };
      initExtra = ''
        [ -f ~/.cache/wal/colors-tty.sh ] && source ~/.cache/wal/colors-tty.sh
        bind '"\e   ": alias-expand-line'
      '';
    };
}
