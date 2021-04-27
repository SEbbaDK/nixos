{ pkgs, ... }:
let
  user = import ../user.nix;
  kakoune-pkgs = import (fetchTarball "https://github.com/sebbadk/nixpkgs/archive/kakoune.tar.gz") { inherit pkgs; };
  config = pkgs.writeTextFile (rec {
    name = "kakrc.kak";
    destination = "/share/kak/autoload/${name}";
    text = ''
      eval %sh{ kak-lsp --kakoune -s $kak_session }
      lsp-enable
    '';
  });
in
{
  environment.systemPackages = [
    (kakoune-pkgs.kakoune.override {
      plugins = with kakoune-pkgs.kakounePlugins; [
        config
        kakoune-buffers
        fzf-kak
        kak-lsp
        pandoc-kak
        tabs-kak
        kakboard
      ];
    })
  ];
  home-manager.users.${user}.programs.kakoune = {
    enable = true;
    config = {
      numberLines.enable = true;
      tabStop = 4;
      ui.changeColors = false;
      wrapLines = {
        enable = true;
        indent = true;
        marker = "⏎";
        word = true;
      };
      hooks = [
        { name = "WinCreate"; option = ".*"; commands = "kakboard-enable"; }
      ];
    };
  };
}
