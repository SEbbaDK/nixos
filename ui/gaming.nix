{ pkgs, ... }:
{
  hardware.graphics = {
      enable = true;
      enable32Bit = true; # Stopping steam error
      extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  };
  # hardware.pulseaudio.support32Bit = true;
}
