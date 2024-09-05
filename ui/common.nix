let
  user = import ../user.nix;
in
{ pkgs, ... }:
{
  services.printing = {
      enable = true;
      drivers = [ pkgs.hplip ];
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Disable caps-lock
  services.xserver.xkb.options = "terminate:ctrl_alt_bksp,ctrl:nocaps";

  services.autorandr.enable = true;

  programs.adb.enable = true;
  users.users.${user}.extraGroups = [ "adbusers" ];
}
