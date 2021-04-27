import ./base.nix
{
  hostname = "vps";
  ui = false;
  deviceImports =
    [
      ./server/bootloader.nix
      ./server/hardware-configuration.nix

      ./server/acme.nix
      ./server/mail.nix
      ./server/networking.nix
      ./server/websites.nix
      ./server/matrix.nix
    ];
  version = "20.09";
  swap = 4;
}
