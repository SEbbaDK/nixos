{ config, pkgs, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.package = pkgs.linuxPackages.nvidia_x11; #config.boot.kernelPackages.nvidiaPackages.legacy390;
  hardware.nvidia.prime = {
    sync.enable = true;
    nvidiaBusId = "PCI:1:0:0";
    intelBusId = "PCI:0:2:0";
  };
}
