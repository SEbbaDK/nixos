{ pkgs, ... }:
let
  secrets = import ../secrets;
  user = import ../user.nix;
  mkMerge = pkgs.lib.mkMerge;
in
{
  services.sshd.enable = true;
  services.openssh = {
    enable = true;
    openFirewall = true;
  };
  users.users.${user}.openssh.authorizedKeys.keys = import ./ssh-keys.nix;
  users.users.root.openssh.authorizedKeys.keys = import ./ssh-keys.nix;

  home-manager.users.${user}.programs.ssh = {
    enable = true;
    serverAliveInterval = 240;
    matchBlocks = mkMerge [
      {
        "pi" = {
          hostname = "10.0.0.2";
          # port = 2201;
          user = "sebbadk";
          # proxyJump = "sebbadk";
        };
        "mac" = {
          hostname = "localhost";
          port = 2222;
          user = "sebbadk";
        };
      }
      secrets.ssh
    ];
  };
}
