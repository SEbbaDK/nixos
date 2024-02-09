{ pkgs, ... }:
{
	networking.nat = {
    	enable = true;
    	externalInterface = "enp0s25";
    	internalInterfaces = [ "wg0" ];
	};
    networking.firewall.allowedUDPPorts = [ 51820 ];

    networking.wireguard.enable = true;
	networking.wireguard.interfaces.wg0 = {
		ips = [ "10.10.10.1/24" ];
		listenPort = 51820;
		privateKey = "QBsYWhyEWRPW54obPmoIz8L1IRJA4v04+8zxLxYPKUU="; #(builtins.readFile ../secrets/wireguard-keys/private);
		peers = [
    		{
        		name = "sebbadk-phone";
        		publicKey = "PajBX9xSPReHsx+D6kpwrtT7DJNHyvGkSlQ26x+kJBY="; #(builtins.readFile ../secrets/wireguard-keys/public);
        		allowedIPs = [ "0.0.0.0/0" ];
    		}
		];
	};
}
