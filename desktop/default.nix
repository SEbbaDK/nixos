import ../base.nix {
  hostname = "desktop";
  ui = true;
  deviceImports =
    [
      ./hardware-configuration.nix
      ./boot.nix
      ./networking.nix
    ];
  swap = 16;
  version = "21.11";
}

