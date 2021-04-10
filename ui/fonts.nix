{ pkgs, ... }:
{
  fonts.fonts = with pkgs; [
    fira-code
    noto-fonts-emoji-blob-bin
  ];
  fonts.fontconfig.defaultFonts = {
    monospace = [ "Fira Code" ];
  };
}
