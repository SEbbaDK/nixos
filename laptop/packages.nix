let
  user = import ../user.nix;
in
{ pkgs, ... }:
{
  users.users.${user}.packages = [
    (pkgs.writeShellScriptBin "mac" ''
      cd /home/${user}/software/osx-kvm && nix-shell -p qemu bash --run ./OpenCore-Boot.sh
    '')
  ];
}
