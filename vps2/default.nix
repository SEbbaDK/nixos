import ../base.nix
{
  hostname = "vps2";
  ui = false;
  deviceImports =
    [
      ./configuration.nix
      ./hardware-configuration.nix
      ./networking.nix
      ./container.nix
      ./nginx.nix

      #./radicale.nix
      ./blog.nix
    ];
  version = "23.11";
  swap = 2;
}
