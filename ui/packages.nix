{ pkgs, ... }:
let
  user = import ../user.nix;
  mypkgs = import ../pkgs { inherit pkgs; };
  masterpkgs = import (fetchTarball "https://github.com/nixos/nixpkgs/archive/master.tar.gz") { config = { nixpkgs.config.allowUnfree = true; allowUnfree = true; permittedInsecurePackages = [ "olm-3.2.16" ]; }; };
in
{
  nixpkgs.config.permittedInsecurePackages = [ "olm-3.2.16" ];
  # These are the packages that aren't included via other mechanisms
  # like nixos or homemanager options and should only be on UI systems
  users.users.${user}.packages = with pkgs; [
    # image
    sxiv
    feh
    qimgv

    # video
    vlc
    ffmpeg-full
    mpv

    # chatapps
    masterpkgs.discord
    masterpkgs.signal-desktop
    masterpkgs.element-desktop
    masterpkgs.gomuks
    #weechat

    # document
    pandoc
    tectonic # LaTeX compiler
    #zathura-with-plugins
    mypkgs.zathura-pywall
    beamerpresenter
    scribus

    # editing
    gimp
    inkscape
    pinta
    #rawtherapee
    #darktable
    scribus
    rapid-photo-downloader

    # screenshot
    peek
    gnome3.gnome-screenshot
    mypkgs.screenshot

    # mail
    thunderbird
    aerc w3m glow # extra used to render
    masterpkgs.gcalcli

    transmission

    # misc
    mypkgs.stregsystem
    arandr
    zotero
    nfs-utils # For mounting the NAS
    pass # Password manager
    mypkgs.chorddown.viewer
    (pkgs.writeShellScriptBin "chords" "${mypkgs.chorddown.browser}/bin/chorddown-browser $HOME/sange")

    # aau vpn
    openconnect

    # gaming
    steam steam-run
    # minecraft
    prismlauncher
    # polymc CVE
    wineWowPackages.full
  ];
}
