{
    networking.firewall.allowedTCPPorts = [ 4533 ];
    virtualisation.oci-containers.containers.navidrome = {
		image = "deluan/navidrome:latest";
		ports = [
    		"4533:4533"
		];
		volumes = [
			"/container/navidrome:/data"
			"/mnt/big/music:/music:ro"
		];
    };
}
