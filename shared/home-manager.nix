{ pkgs ? import <nixpkgs> { }, ... }:
{
  imports = [
    (import "${builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz"}/nixos")
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.main = {
    programs.git = {
      enable = true;
      userName = "SEbbaDK";
      userEmail = "sebbadk@gmail.com";
      extraConfig = {
        pull.ff = "only";
        merge.tool = "vimdiff";
      };
      delta = {
        enable = true;
        options.line-numbers = true;
      };
    };
  };
}
