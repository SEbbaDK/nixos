import ../base.nix {
  hostname = "nas";
  ui = false;
  deviceImports =
    [
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

		./home-assistant.nix
		./photoprism.nix
    ];
  swap = 8;
  version = "20.09";
}

