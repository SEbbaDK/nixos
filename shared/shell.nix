{
  environment = {
    shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -l";
      la = "ls -a";
      grep = "grep --color=auto";
      egrep = "egrep --color=auto";
      grin = "grep -rin";

      # r = "source ranger";

      gl = "git log --oneline --graph --decorate --branches --remotes --tags --color=always | less -RS";
      gs = "git status";
      gc = "git commit -m";
      gca = "git commit --amend";
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

    variables = {
      GCC_COLORS = "error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01";
    };
  };
}
