{ pkgs, config, ... }:
{
  services.printing = {
      enable = true;
      drivers = [ pkgs.hplip pkgs.brlaser ];
  };

  #hardware.pulseaudio.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  services.autorandr.enable = true;

  programs.adb.enable = true;
  users.users.${config.users.main}.extraGroups = [ "adbusers" ];

  services.unclutter.enable = true;
}
