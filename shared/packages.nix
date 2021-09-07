{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    gh
    bash
    vim_configurable
    nodejs # We want nodejs because of vim plugins
    gnumake cmake gcc
    ripgrep pcre # Better grep (<3 -o1)
    ranger sxiv feh
    mediainfo ffmpeg-full
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
    (import (fetchTarball "https://github.com/Shopify/comma/archive/master.tar.gz") { inherit pkgs; })
  ];
  programs.vim.defaultEditor = true;
}
