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
# // { boot.extraModulePackages = [ pkgs.linuxPackages.v412loopback ];
#      boot.kernelModules = [ "v412loopback" "snd-aloop" ]; }
# // { containers.web = { autoStart = true; config = { services.nginx.enable = true; }; }; }
# // { services.usbmuxd.enable = true; }
# // { boot.binfmt.emulatedSystems = [ "aarch64-linux" ]; }
