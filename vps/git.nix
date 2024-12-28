{ pkgs, ... }:
let
  gsh = "${pkgs.git}/bin/git-shell";
in
{
  environment.shells = [ gsh ];
  users.groups.git = {};
  users.users.git = {
    group = "git";
    isSystemUser = true;
    createHome = true;
    openssh.authorizedKeys.keys = (import ../secrets/ssh-keys.nix) ++ [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIICuMDVDKqB1nIi/wOgNCQtTjgYm3X1/XGcJXgSBgjMB sebbadk@phone" ];
    home = "/git";
    shell = gsh;
  };
}
