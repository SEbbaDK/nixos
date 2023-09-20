{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    duplicacy
  ];

  fileSystems."/backup/photos" = {
    device = "/mnt/big/photos";
    options = [ "bind" ];
  };

  fileSystems."/backup/music" = {
    device = "/mnt/big/music";
    options = [ "bind" ];
  };
}
