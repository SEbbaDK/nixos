{ pkgs, ... }:
let
    mypkgs = import ../pkgs { inherit pkgs; };
#    scmd = command:
#       "${pkgs.bash}/bin/bash -c '${command} && ${mypkgs.sound-osd}/bin/sound-osd'";
#in
#{
#    sound.mediaKeys.enable = false; # We do it ourselves
#
#    services.actkbd = {
#        enable = true;
#        bindings = [
#
#            # Media key bindings
#            { keys = [ 113 ]; events = [ "key" ];
#              command = scmd "${pkgs.alsaUtils}/bin/amixer -q set Master toggle"; }
#            { keys = [ 114 ]; events = [ "key" "rep" ];
#              command = scmd "${pkgs.alsaUtils}/bin/amixer -q set Master 5- unmute"; }
#            { keys = [ 115 ]; events = [ "key" "rep" ];
#              command = scmd "${pkgs.alsaUtils}/bin/amixer -q set Master 5+ unmute"; }
#        ];
#    };

    #sound.mediaKeys.enable = true;
    #services.illum.enable = true;

    dfk-conf = pkgs.writeTextFile {
        name = "dfk-conf.yml";
        text = ''
        MAPPINGS:
          - KEY: KEY_CAPSLOCK
            TAP: KEY_ESCAPE
            HOLD: KEY_META
        '';
    };
in
{
    sound.mediaKeys.enable = false; # We do it ourselves

    services.interception-tools = {
        enable = true;
        plugins = with pkgs.interception-tools-plugins; [
            dual-function-keys
        ];
        udevmonConfig = ''
            - JOB: "intercept -g $DEVNODE | dual-function-keys -c ${dfk-conf} | uinput -d $DEVNODE
              DEVICE:
                EVENTS:
                  EV_KEY: [ KEY_CAPSLOCK ]
                NAME: 
        '';
    };
}
