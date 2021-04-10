{ pkgs, ... }:
{
  hardware.opengl = {
    enable = true;
    setLdLibraryPath = true;
    package = pkgs.mesa_drivers;
  };
  hardware.deviceTree = {
    kernelPackage = pkgs.linux_rpi4;
    overlays = [ "${pkgs.device-tree_rpi.overlays}/vc4-fkms-v3d.dtbo" ];
  };
  boot.loader.raspberryPi.firmwareConfig = ''
    gpu_mem=192
  '';
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    videoDrivers = [ "modesetting" ];
  };
}
