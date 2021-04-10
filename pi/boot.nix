{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_rpi4;
    kernelParams = [
      "8250.nr_uarts=1"
      "console=ttyAMA0,115200"
      "console=tty1"
      #"cma=128M"
    ];
    loader.raspberryPi = {
      enable = true;
      version = 4;
    };
    loader.grub.enable = false;
    loader.generic-extlinux-compatible.enable = true;
  };
}
