{ pkgs, ... }:
let
  user = import ../user.nix;
  mypkgs = import ../pkgs;
  masterpkgs = import (fetchTarball "https://github.com/nixos/nixpkgs/archive/master.tar.gz") { config = { nixpkgs.config.allowUnfree = true; allowUnfree = true; }; };
in
{
  users.users.${user}.packages = with pkgs; [
    kitty
    masterpkgs.discord
    teams
    weechat
    element-desktop
    zathura
    geogebra
    vlc

	nfs-utils # For mounting the NAS

    gimp
    inkscape

    peek
    shutter
    gnome3.gnome-screenshot
    thunderbird
    pinta
    #rawtherapee
    #darktable
    transmission
    kdeconnect
    mypkgs.screenshot
    (writeScriptBin "clion-parseaal" "nix-shell /home/${user}/software/parseaal/ --run 'clion /home/${user}/software/parseaal/'")
    (writeScriptBin "overleaf" "nix-shell -p chromium --run 'chromium --app=https://www.overleaf.com/project/602541e7e825872d90a4b3b8'")
    arandr

    # AAU VPN
    openconnect

    # GAMING
    steam steam-run
    minecraft

    wineWowPackages.full

    pandoc
    #texlive.combined.scheme-full
  ];
}
