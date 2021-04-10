{ pkgs, ... }:
{
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true; # Stopping steam error
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  hardware.pulseaudio.support32Bit = true;
}
