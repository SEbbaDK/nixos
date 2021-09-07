import ./base.nix {
  hostname = "nas";
  ui = false;
  deviceImports =
    [
		./nas/boot.nix
		./nas/drives.nix
		./nas/hardware-configuration.nix
		./nas/networking.nix
		./nas/nfs.nix
		./nas/packages.nix
		./nas/torrent.nix
		./nas/dlna.nix
    ];
  swap = 8;
  version = "20.09";
}

