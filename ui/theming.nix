{
	qt5.style = "adwaita-dark";
	qt5.platformTheme = "gtk";
	services.xserver.displayManager.lightdm.greeters.gtk.theme.name = "adwaita-dark";
	services.xserver.displayManager.lightdm.greeters.enso.theme.name = "adwaita-dark";
    environment.variables.GTK_THEME = "Adwaita:dark";
}
