let
  user = import ../user.nix;
in
{ pkgs, ... }:
{
  services.displayManager = {
    defaultSession = "none+i3";
  };
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      configFile = ./i3.conf;
      #workspaceNaming = true;
      extraPackages = with pkgs; [
        dmenu
        rofi
        i3status
        i3lock-color
        libnotify
        dunst
        pywal
        # i3wsr
        # swaywsr
      ];
    };
  };

  services.picom = {
    enable = true;
    vSync = true;

	activeOpacity = 1.0;
	inactiveOpacity = 1.0;
	#inactiveOpacity = 0.85;
	menuOpacity = 1.0;
    opacityRules = [
		"100:class_g = 'Rofi'"
    ];

    shadow = true;
    shadowExclude = [
        # Don't stack shadows when tabbing windows
        "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
    ];

	# https://github.com/yshui/picom/issues/620
	#backend = "glx";
	settings = {
    	blur-background = true;
    	blur-background-fixed = true;
        blur = {
    		method = "kernel";
    		kernel = "7x7box";
        };
	};
  };
}
