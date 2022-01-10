let
  user = import ../user.nix;
in
{
  imports =
    [
      ./home-manager.nix

      # Note that shell.nix should also be changed
      # if the switch back to bash is made
      # ./bash.nix
      ./fish.nix
      ./danish.nix
      ./kakoune.nix
      ./keyring.nix
      ./packages.nix
      ./shell.nix
      ./ssh.nix
      ./syncthing.nix
      ./vim.nix
      # ./ssh-keys.nix is imported via user keys
    ];

  nixpkgs.config.allowUnfree = true;

  users.users.${user} = {
    initialPassword = "temporary";
    isNormalUser = true;
    extraGroups = [ "wheel" "dialout" "cdrom" ];
  };
  security.sudo.extraRules = [ {
      users = [ "sebbadk" ];
      commands = [ {
          command = "ALL";
          options = [ "NOPASSWD" ];
      } ];
  } ];
  # This is to allow cachix use
  nix.trustedUsers = [ "root" user ];
}
