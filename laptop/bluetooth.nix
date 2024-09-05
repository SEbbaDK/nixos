{ pkgs, ... }:
{
  hardware.bluetooth.enable = true;
  #hardware.pulseaudio.extraModules = [ pkgs.pulseaudio-modules-bt ];
}
