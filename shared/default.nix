let
  user = import ../user.nix;
in
{
  imports =
    [
      ./home-manager.nix

      ./bash.nix
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
}
