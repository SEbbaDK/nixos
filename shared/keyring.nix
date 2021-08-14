{
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gnome3";
  };
  services.gnome.gnome-keyring.enable = true;
}
