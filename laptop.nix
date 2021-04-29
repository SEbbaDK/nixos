import ./base.nix {
  hostname = "laptop";
  ui = true;
  deviceImports =
    [
      ./laptop/hardware-configuration.nix
      ./laptop/bootloader.nix
      ./laptop/bluetooth.nix
      ./laptop/gpu.nix
      ./laptop/networking.nix
      ./laptop/touchpad.nix
      ./laptop/packages.nix
    ];
  swap = 16;
  version = "20.09";
}

