import ../base.nix {
  hostname = "laptop";
  ui = true;
  deviceImports =
    [
      ./hardware-configuration.nix
      ./bootloader.nix
      ./bluetooth.nix
      ./gpu.nix
      ./networking.nix
      ./touchpad.nix
      ./packages.nix
    ];
  swap = 16;
  version = "20.09";
}

