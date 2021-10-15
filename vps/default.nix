import ../base.nix
{
  hostname = "vps";
  ui = false;
  deviceImports =
    [
      ./boot.nix
      ./hardware-configuration.nix

      ./acme.nix
      ./mail.nix
      ./networking.nix
      ./websites.nix
      ./matrix.nix
      ./tunnel.nix
    ];
  version = "21.05";
  swap = 4;
}
