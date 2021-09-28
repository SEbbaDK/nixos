import ../base.nix
{
  hostname = "vps";
  ui = false;
  deviceImports =
    [
      ./bootloader.nix
      ./hardware-configuration.nix

      ./acme.nix
      ./mail.nix
      ./networking.nix
      ./websites.nix
      ./matrix.nix
    ];
  version = "20.09";
  swap = 4;
}
