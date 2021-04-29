{ pkgs, ... }:
let
  user = import ../user.nix;
  mypkgs = import ../pkgs;
in
{
  users.users.${user}.packages = with pkgs; [
    kitty
    jetbrains.clion
    discord
    teams
    weechat
    element-desktop
    zathura
    geogebra
    vlc

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
    arandr

    # AAU VPN
    openconnect

    # GAMING
    # steam steam-run
    minecraft

    wineWowPackages.full

    pandoc
    #texlive.combined.scheme-full
  ];
}
