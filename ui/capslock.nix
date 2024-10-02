{ pkgs, ... }:
let
  modmapconf = pkgs.writeText  "xkb-layout" ''
    clear Lock
    keycode 66 = Hyper_L
    remove mod4 = Hyper_L
    add mod3 = Hyper_L
  '';
  keymapperconf = pkgs.writeText "keymapper.conf" ''
    CapsLock{H} >> ArrowLeft
    CapsLock{J} >> ArrowDown
    CapsLock{K} >> ArrowUp
    CapsLock{L} >> ArrowRight

    CapsLock{7} >> "{"
    CapsLock{8} >> "["
    CapsLock{9} >> "]"
    CapsLock{0} >> "}"

    CapsLock{I} >> "|"

    CapsLock >> Escape
  '';
in
{
  services.xserver.displayManager.sessionCommands = "${pkgs.xorg.xmodmap}/bin/xmodmap ${modmapconf}";

  systemd.packages = [ pkgs.keymapper ];

  systemd.user.services.keymapper = {
	enable = true;
	description = "Keymapper for CapsLock setup";
	after = [ "keymapperd.service" ];
	serviceConfig.ExecStart = "${pkgs.keymapper}/bin/keymapper -c ${keymapperconf}";
	wantedBy = [ "multi-user.target" ];
  };
}

