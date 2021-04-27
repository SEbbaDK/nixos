{ hostname
, ui
, deviceImports
, version
, swap ? 0
, system ? {
    config = "x86_64-unknown-linux-gnu";
    system = "x86_64-linux";
  }
}:
{ pkgs, config, ... }:
let
  user = import ./user.nix;
in
{
  imports =
    [
      (import "${builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz"}/nixos")
      ./shared/home-manager.nix

      ./shared/bash.nix
      ./shared/danish.nix
      ./shared/kakoune.nix
      ./shared/keyring.nix
      ./shared/packages.nix
      ./shared/shell.nix
      ./shared/ssh.nix
      ./shared/syncthing.nix
      ./shared/vim.nix
      # ./shared/ssh-keys.nix is imported via user keys
    ]
    ++ deviceImports
    ++ (if ui then [ ./ui ] else [ ]);

  networking.hostName = hostname;

  users.users.${user} = {
    initialPassword = "temporary";
    isNormalUser = true;
    extraGroups = [ "wheel" "dialout" "cdrom" "syncthing" ];
  };

  nixpkgs.config.allowUnfree = true;
  # nixpkgs.crossSystem = with config.nixpgs;
  # if (localSystem.config != system.config || localSystem.system != system.system)
  # then system
  # else null;

  system.stateVersion = version;

  swapDevices = pkgs.lib.optional
    (swap > 0)
    { device = "/swap"; size = 1024 * swap; };
}

