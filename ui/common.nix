let
  user = import ../user.nix;
in
{
  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Disable caps-lock
  services.xserver.xkbOptions = "terminate:ctrl_alt_bksp,ctrl:nocaps";

  services.autorandr.enable = true;

  programs.adb.enable = true;
  users.users.${user}.extraGroups = [ "adbusers" ];
}
