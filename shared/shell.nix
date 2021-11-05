{
    environment.shellAliases = {
        ls = "ls --color=auto";
        ll = "ls --color=auto -lh";
        grep = "grep --color=auto";
        egrep = "egrep --color=auto";
    };
    # In other shells these should just be in aliases
    programs.fish.shellAbbrs = {
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

        yt-mp3 = "youtube-dl --extract-audio --audio-format mp3 --embed-thumbnail --add-metadata -o \"%(title)s.%(ext)s\"";

        "clip" = "xclip";
        "clipo" = "xclipo -o";
        "+clip" = "xclip -sel clip";
        "+clipo" = "xclip -sel clip -o";

        nsrch = "nix search";
        nsh = "nix-shell";

        t = "todo.sh";

        snores = "sudo nixos-rebuild switch";
    };

    environment.variables = {
        GCC_COLORS = "error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01";
    };
}
