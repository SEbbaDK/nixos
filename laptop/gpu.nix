{ pkgs, ... }:
{
    #boot.initrd.kernelModules = [ "amdgpu" ];
    #services.xserver.videoDrivers = [ "amdgpu" ];
    hardware.opengl.extraPackages = [
        pkgs.vaapiVdpau
        pkgs.libvdpau-va-gl
        pkgs.rocmPackages.clr
        pkgs.rocmPackages.clr.icd
        pkgs.amdvlk
    ];
    hardware.opengl.extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];

    environment.systemPackages = [ pkgs.lact ];
    systemd.packages = [ pkgs.lact ];
    systemd.services.lact.wantedBy = [ "multi-user.target" ];
}

