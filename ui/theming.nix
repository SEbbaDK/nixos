{
	qt5.style = "adwaita-dark";
	qt5.platformTheme = "gtk";
	services.xserver.displayManager.lightdm.greeters = {
    	#enso.enable = true;
    	mini.enable = true;
    	mini.user = import ../user.nix;
    	gtk.theme.name = "adwaita-dark";
		enso.theme.name = "adwaita-dark";
	};
    environment.variables.GTK_THEME = "Adwaita:dark";
}
