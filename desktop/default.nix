import ../base.nix {
  hostname = "desktop";
  ui = true;
  deviceImports =
    [
      ./hardware-configuration.nix
      ./system.nix
    ];
  swap = 2;
  version = "23.05";
}

