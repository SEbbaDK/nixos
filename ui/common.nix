{ pkgs, config, ... }:
{
  services.printing = {
      enable = true;
      drivers = [ pkgs.hplip ];
  };

  hardware.pulseaudio.enable = true;

  services.autorandr.enable = true;

  programs.adb.enable = true;
  users.users.${config.users.main}.extraGroups = [ "adbusers" ];

  services.unclutter.enable = true;
}
