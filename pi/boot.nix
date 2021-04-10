{ config, ... }:
let
  pkgs = import (fetchTarball "https://github.com/colemickens/nixpkgs/archive/rpi4-uboot.tar.gz") {};
in
{
  boot = {
    kernelPackages = pkgs.lib.mkForce pkgs.linuxPackages_latest;
    kernelParams = [
      "8250.nr_uarts=1"
      "console=ttyAMA0,115200"
      "console=tty1"
      #"cma=128M"
    ];
    loader.raspberryPi = {
      enable = true;
      version = 4;
      uboot.enable = true;
      uboot.configurationLimit = 5;
    };
    loader.grub.enable = false;
    initrd.availableKernelModules = [
      "pcie_brcmstb" "bcm_phy_lib" "broadcom" "mdio_bcm_unimac" "genet"
      "vc4" "bcm2835_dma" "i2c_bcm2835"
      "xhci_pci" "nvme" "usb_storage" "sd_mod"
    ];
    kernelModules = config.boot.initrd.availableKernelModules;
  };

  hardware.enableRedistributableFirmware = true;
}
