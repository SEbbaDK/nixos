{ pkgs, ... }:
let
#	redirect = from: to: {
#		keys = from;
#		events = [ "key" ];
#		attributes = [ "noexec" "key(${toString to})" "rel(${toString to})" ];
#	};
#
#	# Found with `actkbd -n -s`
#	capslock = 58;
#	h = 35; left  = 105;
#	j = 36; down  = 108;
#	k = 37; up	= 103;
#	l = 38; right = 106;

	layout = pkgs.writeText "xkb-layout" ''
clear Lock
keycode 66 = ISO_Level3_shift ISO_Level3_shift ISO_Level3_shift ISO_Level3_shift
add Mod5 = ISO_Level3_shift
	'';
	snail = pkgs.writeText "xkeysnail-conf.py" ''
from xkeysnail.transform import *

define_keymap(
    lambda _: True,
    {
        K('RM-h'): K('left'),
        K('RM-j'): K('down'),
        K('RM-k'): K('up'),
        K('RM-l'): K('right'),
    },
    'Vim arrows'
)
	'';
in
{
#	services.actkbd = {
#		enable = true;
#		bindings = [
#			{ keys = [ capslock ]; events = [ "key" ]; attributes = [ "noexec" "grab" ]; }
#			{ keys = [ capslock ]; events = [ "rel" ]; attributes = [ "noexec" "ungrab" ]; }
#			(redirect [ capslock h ] left)
#		];
#	};

	# Disable caps-lock
	services.xserver = {
		displayManager.sessionCommands = ''
			${pkgs.xorg.xmodmap}/bin/xmodmap ${layout}
		'';
		xkbOptions = "terminate:ctrl_alt_bksp";
		# xkbOptions = "terminate:ctrl_alt_bksp,ctrl:nocaps";
	};

	systemd.services.xkeysnail = {
    	enable = true;
    	script = ''
			${pkgs.xkeysnail}/bin/xkeysnail ${snail}
    	'';
    	requires = [ "graphical-session.target" ];
    	after = [ "graphical-session.target" ];
    	wantedBy = [ "multi-user.target" ];
	};
}
