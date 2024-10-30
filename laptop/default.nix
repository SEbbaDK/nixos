import ../base.nix {
  hostname = "laptop";
  ui = true;
  deviceImports =
    [
      ./boot.nix
      ./gpu.nix
      ./hardware-configuration.nix
      ./bluetooth.nix
      ./networking.nix
      ./touchpad.nix
    ];
  swap = 16;
  version = "20.09";
}

