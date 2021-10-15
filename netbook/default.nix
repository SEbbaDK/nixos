import ../base.nix {
  hostname = "netbook";
  ui = false;
  deviceImports =
    [
      ./hardware-configuration.nix
      ./boot.nix
      ./sound-and-network.nix
      ./tunnel.nix
    ];
  swap = 2;
  version = "21.05";
}

