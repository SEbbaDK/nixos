let
  user = import ../user.nix;
  mypkgs = import ../pkgs;
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
          BEHIND=$(echo "$AHEAD_BEHIND" | grep -oP "^[0-9]+  \K[0-9]+")
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

    initExtra = ''
      bind '"\e   ": alias-expand-line'
    '';
  };
}
