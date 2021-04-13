{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bash
    wget
    vim_configurable nodejs # We want nodejs because of vim plugins
    git gnumake cmake gcc
    ranger
    mediainfo
    ffmpeg-full
    htop
    xclip
    unzip
    unrar
    ntfs3g # NTFS support (mkfs.ntfs)
    youtube-dl
    todo-txt-cli
    gdb
    djbdns # DNS utilities
    usbutils
    miraclecast # Cast to TV
    ripgrep
    (import (fetchTarball "https://github.com/Shopify/comma/archive/master.tar.gz") { inherit pkgs; })
  ];
  programs.vim.defaultEditor = true;
}
