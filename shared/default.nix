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
      ./acme.nix
      ./fish.nix
      ./danish.nix
      ./kakoune.nix
      ./keyring.nix
      ./packages.nix
      ./ranger.nix
      ./shell.nix
      ./ssh.nix
      ./vim.nix
      # ./ssh-keys.nix is imported via user keys
    ];

  nixpkgs.config.allowUnfree = true;
  system.copySystemConfiguration = true;

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
}
