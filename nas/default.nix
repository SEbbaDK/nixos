import ../base.nix {
  hostname = "nas";
  ui = false;
  deviceImports =
    [
        ./adguard.nix
		./boot.nix
		./drives.nix
		./hardware-configuration.nix
		./home-assistant.nix
		./networking.nix
		./nfs.nix
		./packages.nix
		./syncthing.nix
		./torrent.nix
		./dlna.nix
    ];
  swap = 8;
  version = "20.09";
}

