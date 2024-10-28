import ../base.nix
{
  hostname = "vps";
  ui = false;
  deviceImports =
    [
      ./boot.nix
      ./hardware-configuration.nix

      ./git.nix
      ./mail.nix
      ./matrix.nix
      ./networking.nix
      ./sonica.nix
      ./tunnel.nix
      ./websites.nix
    ];
  version = "21.05";
  swap = 2;
}
