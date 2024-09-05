{ pkgs, ... }:
let
  mypkgs = import ../pkgs { inherit pkgs; };
in
{
  #boot.kernelPackages = pkgs.linuxPackages_latest;
  environment.systemPackages = with pkgs; [
    bat
    bluetuith
    curl
    fd
    fzf
    gdb
    gdu # Disk Usage
    gh glab
    git
    gnumake cmake gcc
    htop
    jq fx # Work with json on commandline
    mediainfo
    miraclecast # Cast to TV
    mypkgs.barion
    comma
    ntfs3g # NTFS support (mkfs.ntfs)
    ranger
    ripgrep pcre # Better grep (<3 -o1)
    screen
    tabview # CSV viewer
    todo-txt-cli
    tree
    unzip unrar
    usbutils
    vim_configurable
    wget whois dig djbdns # WEB and DNS utilities
    xclip
    ydiff
    yt-dlp
  ];
}
