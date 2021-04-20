{ pkgs, ... }:
let
  user = import ../user.nix;
  kakoune-pkgs = import (fetchTarball "https://github.com/sebbadk/nixpkgs/archive/kakoune.tar.gz") { inherit pkgs; };
in
{
  environment.systemPackages = [ pkgs.kakoune ];
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
    };
    plugins = with kakoune-pkgs.kakounePlugins; [
	  kakoune-buffers
	  fzf-kak
	  kak-lsp
	  pandoc-kak
    ];
  };
}
