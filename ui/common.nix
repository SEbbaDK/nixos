let
  user = import ../user.nix;
in
{ pkgs, ... }:
{
  services.printing = {
      enable = true;
      drivers = [ pkgs.hplip ];
  };

  hardware.pulseaudio.enable = true;

  services.autorandr.enable = true;

  programs.adb.enable = true;
  users.users.${user}.extraGroups = [ "adbusers" ];

  services.unclutter.enable = true;
}
