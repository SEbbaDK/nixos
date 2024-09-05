{ pkgs, ... }:
{
  services.libinput = {
    enable = true;
    #naturalScrolling = true;
    touchpad = {
        naturalScrolling = true;
        accelProfile = "flat";
    };
  };
}
