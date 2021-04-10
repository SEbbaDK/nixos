import ./base.nix {
  hostname = "pi";
  ui = false;
  deviceImports =
  [
    ./pi/hardware-configuration.nix

    # Doesn't work >:(
    # ./pi/hardware-gpu.nix
    ./pi/software-gpu.nix
    ./pi/network.nix
    ./pi/boot.nix
  ];
  swap = 2;
  version = "21.03";
  system = { config = "aarch64-unknown-linux-gnu"; system = "aarch64-linux"; };
}
