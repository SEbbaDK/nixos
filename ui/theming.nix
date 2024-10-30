{ config, ... }:
{
	qt.style = "adwaita-dark";
	qt.platformTheme = "gtk";
	services.xserver.displayManager.lightdm.greeters = {
    	#enso.enable = true;
    	mini.enable = true;
    	mini.user = config.users.main;
    	gtk.theme.name = "adwaita-dark";
		enso.theme.name = "adwaita-dark";
	};
    environment.variables.GTK_THEME = "Adwaita:dark";
}
