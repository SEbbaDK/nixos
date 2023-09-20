{
    networking.firewall.allowedTCPPorts = [ 9091 ];
    services.transmission = {
        enable = true;
        settings = {
            "rpc-username" = "shenbosi";
            "rpc-password" = "TransmissionPassword";
            "download-dir" = "/mnt/big/media/downloads";
            "incomplete-dir" = "/mnt/big/media/incomplete";
            "incomplete-dir-enabled" = true;
            "rpc-bind-address" = "0.0.0.0";
            "rpc-whitelist" = "127.0.0.1,10.0.0.*,192.168.0.*";
        };
    };
}
