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
    extraConfig = ''
		ClientAliveInterval=30
		ClientAliveCountMax=2
    '';
  };
  users.users.${user}.openssh.authorizedKeys.keys = import ./ssh-keys.nix;
  # Maybe this shouldn't be enabled?
  # users.users.root.openssh.authorizedKeys.keys = import ./ssh-keys.nix;

  home-manager.users.${user}.programs.ssh = {
    enable = true;
    serverAliveInterval = 240;
    matchBlocks = secrets.ssh;
    extraConfig = ''
        KexAlgorithms +diffie-hellman-group14-sha1
    '';
  };
}
