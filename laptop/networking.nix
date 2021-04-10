{ pkgs, ... }:
{
  networking.firewall.enable = false;
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.wireless.userControlled.enable = true;

  environment.systemPackages = [ pkgs.wpa_supplicant_gui ];
  networking.wireless.networks = {
    "Skyggelund Net" = {};
    "ABK" = {
      auth = ''
        identity="lejl106"
        password="maovuw75"
        key_mgmt=WPA-EAP
        eap=PEAP
        phase1="peaplabel=0"
        phase2="auth=MSCHAPV2"
      '';
    };
    "UwU".psk = "1000nyaa";
    "sebbadk-phone".psk = "whaniscute";
    "WanStue_5G".psk = "thunderbean";
  };

  networking.useDHCP = false;
  networking.interfaces.enp0s25.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  # networking.bridges.br0.interfaces = [ "enp0s25" "wlp3s0" ];
  # networking.interfaces.tap0.virtualType = "tap";
  # networking.bridges.br0.interfaces = [ "wlp3s0" "tap0" ];
}
