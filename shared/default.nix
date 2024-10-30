{ config, ... }:
{
  imports =
    [
      ./home-manager.nix
      ../modules/user.nix

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

  users.main = "sebbadk";

  nixpkgs.config.allowUnfree = true;
  nix.settings = {
      trusted-users = [ "root" "@wheel" ];
      experimental-features = [ "nix-command" ];
  };

  users.users.${config.users.main} = {
    initialPassword = "temporary";
    isNormalUser = true;
    extraGroups = [ "wheel" "dialout" "cdrom" ];
  };
  security.sudo.extraRules = [ {
      users = [ config.users.main ];
      commands = [ {
          command = "ALL";
          options = [ "NOPASSWD" ];
      } ];
  } ];
}
