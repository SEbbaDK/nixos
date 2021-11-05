{
    networking.firewall.allowedTCPPorts = [ 7700 ];
    networking.firewall.allowedUDPPorts = [ 7700 ];
	services.nginx.streamConfig = ''
		upstream sonicatunnel {
			server localhost:7701;
		}

		server {
			listen 0.0.0.0:7700;
			proxy_pass sonicatunnel;
		}
	'';
}
