import ./base.nix {
  hostname = "nas";
  ui = false;
  deviceImports =
    [
		./nas/boot.nix
		./nas/hardware-configuration.nix
		./nas/networking.nix
    ];
  swap = 8;
  version = "20.09";
}

