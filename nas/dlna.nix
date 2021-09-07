{
    networking.firewall.allowedTCPPorts = [ 8200 ];
    networking.firewall.allowedUDPPorts = [ 1900 ];
    services.minidlna = {
        enable = true;
        friendlyName = "NAS";
        mediaDirs = [
            "A,/mnt/big/music"
            "/mnt/big/media"
            "/mnt/big/photos"
        ];
    };
}
