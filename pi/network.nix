{
  # Needed for wifi drivers
  hardware.enableRedistributableFirmware = true;
  
  networking.useDHCP = false;
  networking.interfaces."eth0".useDHCP = true;
  networking.interfaces."wlan0".useDHCP = true;
}
