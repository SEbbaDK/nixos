import ../base.nix {
  hostname = "nas";
  ui = false;
  deviceImports =
    [
		./boot.nix
		./drives.nix
		./hardware-configuration.nix
		./networking.nix
		./nfs.nix
		./packages.nix
		./torrent.nix
		./dlna.nix
    ];
  swap = 8;
  version = "20.09";
}

