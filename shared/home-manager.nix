let
  user = import ../user.nix;
in
{ pkgs ? import <nixpkgs> { }, ... }:
{
  imports = [
    (import "${builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz"}/nixos")
  ];

  home-manager.users.${user} = {
    nixpkgs.config.allowUnfree = true;

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
