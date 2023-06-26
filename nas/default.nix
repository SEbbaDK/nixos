import ../base.nix {
  hostname = "nas";
  ui = false;
  deviceImports =
    [
        ./adguard.nix
		./boot.nix
		./drives.nix
		./duplicacy.nix
		./hardware-configuration.nix
		./networking.nix
		./nfs.nix
		./packages.nix
		./syncthing.nix
		./torrent.nix
		./dlna.nix
		../laptop/bluetooth.nix

		./docker.nix
		./home-assistant.nix
		./photoprism.nix
		./navidrome.nix
    ];
  swap = 8;
  version = "20.09";
}

