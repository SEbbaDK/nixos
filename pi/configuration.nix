# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, ... }:
let
  pkgs = import
    (builtins.fetchTarball {
      name = "nixos-last-working";
      url = "https://github.com/NixOS/nixpkgs/archive/2f47650c2f28d87f86ab807b8a339c684d91ec56.tar.gz";
      sha256 = "17akl75x28rzq97gaad32flswdsp150nfsg7h909kda721zql71a";
    })
    { };  
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

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

  hardware.enableRedistributableFirmware = true;

  networking.hostName = "pi";
  networking.interfaces."eth0" = {
    useDHCP = true;
    # ipv4.addresses = [ { address = "10.0.0.2"; prefixLength = 24; } ];
  };
  # networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  services.sshd.enable = true;


  # GPU
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
    # videoDrivers = [ "fbdev" ];
    resolutions = [ { x = 1920; y = 1080; } ];
  };

  system.stateVersion = "21.03"; # Did you read the comment?
}

