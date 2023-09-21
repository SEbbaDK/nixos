{
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.opengl.enable = true;
    #hardware.nvidia.package = config.boot.kernelPackages.nvidia_x11_legacy470;
}
