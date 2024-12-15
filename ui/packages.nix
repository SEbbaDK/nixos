{ pkgs, config, ... }:
let
  mypkgs = import ../pkgs { inherit pkgs; };
  masterpkgs = import (fetchTarball "https://github.com/nixos/nixpkgs/archive/master.tar.gz") { config = { nixpkgs.config.allowUnfree = true; allowUnfree = true; permittedInsecurePackages = [ "olm-3.2.16" ]; }; };
in
{
  nixpkgs.config.permittedInsecurePackages = [ "olm-3.2.16" ];
  # These are the packages that aren't included via other mechanisms
  # like nixos or homemanager options and should only be on UI systems
  users.users.${config.users.main}.packages = with pkgs; [
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
    ferdium
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
    gnome-screenshot
    mypkgs.screenshot

    # mail
    thunderbird
    aerc w3m glow # extra used to render
    gcalcli

    transmission_4

    # misc
    mypkgs.stregsystem
    arandr
    zotero_7 sioyek # Researchværktøjer
    nfs-utils # For mounting the NAS
    pass # Password manager
    #mypkgs.chorddown.viewer mypkgs.chorddown.browser
    #(pkgs.writeShellScriptBin "chords" "${mypkgs.chorddown.browser}/bin/chorddown-browser $HOME/sange")

    # aau vpn
    openconnect

    # gaming
    steam steam-run
    # minecraft
    prismlauncher
    # polymc CVE
    wineWowPackages.full
  ];

  home-manager.main.xdg.mimeApps = {
	enable = true;
	defaultApplications = {
	  "application/pdf" = "Zathura.desktop";
      "x-scheme-handler/sms" = "org.gnome.Shell.Extensions.GSConnect.desktop";
      "x-scheme-handler/tel" = "org.gnome.Shell.Extensions.GSConnect.desktop";
	};
  };
}
