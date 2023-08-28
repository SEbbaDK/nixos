import ../base.nix {
  hostname = "desktop";
  ui = true;
  deviceImports =
    [
      ./hardware-configuration.nix
      ./boot.nix
      ./networking.nix
      ./gpu.nix
    ];
  swap = 2;
  version = "21.11";
}

