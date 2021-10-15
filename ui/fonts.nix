{ pkgs, ... }:
let
	mypkgs = import ../pkgs { inherit pkgs; };
in
{
  fonts.fonts = with pkgs; [
    fira-code
    noto-fonts-emoji-blob-bin
	mypkgs.fira-code-victor
  ];
  fonts.fontconfig.defaultFonts = {
    monospace = [ "Fira Code Victor" ];
  };
}
