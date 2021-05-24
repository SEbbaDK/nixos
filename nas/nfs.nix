{
    fileSystems."/nfs/photos" = {
        device = "/mnt/big/photos";
        options = [ "bind" ];
    };

    networking.firewall.allowedTCPPorts = [ 2049 ];
	services.nfs.server = {
    	enable = true;
    	exports = ''
			/nfs		10.0.0.0/24(insecure,nohide,rw,sync,no_subtree_check)
			/nfs/photos	10.0.0.0/24(insecure,nohide,rw,sync,no_subtree_check,no_root_squash)
    	'';
	};
}
