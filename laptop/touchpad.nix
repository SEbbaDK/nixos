{ pkgs, ... }:
{
  services.xserver.libinput = {
    enable = true;
    #naturalScrolling = true;
    touchpad.naturalScrolling = true;
  };
}
