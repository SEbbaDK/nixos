{ pkgs, ... }:
let
	mypkgs = import ../pkgs { inherit pkgs; };
in
{
  #boot.kernelPackages = pkgs.linuxPackages_latest;
  environment.systemPackages = with pkgs; [
    git
    gh glab
    vim_configurable
    nodejs # We want nodejs because of vim plugins
    gnumake cmake gcc
    ripgrep pcre # Better grep (<3 -o1)
    ranger
    mediainfo
    htop
    xclip
    unzip unrar
    ntfs3g # NTFS support (mkfs.ntfs)
    youtube-dl
    todo-txt-cli
    gdb
    wget whois dig djbdns # WEB and DNS utilities
    usbutils
    miraclecast # Cast to TV
    #mypkgs.comma # Disabled because it was broken
    mypkgs.barion
    gdu # Disk Usage
  ];
}
