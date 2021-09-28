import ../base.nix {
  hostname = "pi";
  ui = false;
  deviceImports =
    [
      ./hardware-configuration.nix

      # Doesn't work >:(
      # ./hardware-gpu.nix
      ./software-gpu.nix
      ./network.nix
      ./boot.nix
    ];
  swap = 2;
  version = "21.03";
  system = { config = "aarch64-unknown-linux-gnu"; system = "aarch64-linux"; };
}
