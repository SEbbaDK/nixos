{ pkgs, ... }:
let
  secrets = import ../secrets;
in
{
  networking.firewall.enable = false;
  networking.networkmanager.enable = true; # Enables wireless support via wpa_supplicant.
  #networking.wireless.userControlled.enable = true;

  environment.systemPackages = [ pkgs.wpa_supplicant_gui ];
  #networking.wireless.networks = secrets.wifi;

  #networking.useDHCP = false;
  #networking.interfaces.enp0s25.useDHCP = true;
  #networking.interfaces.wlp3s0.useDHCP = true;

  #networking.wireless.interfaces = [ "wlp3s0" ];

  # networking.bridges.br0.interfaces = [ "enp0s25" "wlp3s0" ];
  # networking.interfaces.tap0.virtualType = "tap";
  # networking.bridges.br0.interfaces = [ "wlp3s0" "tap0" ];
}
