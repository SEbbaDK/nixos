{
    fileSystems."/nfs/photos" = {
        device = "/mnt/big/photos";
        options = [ "bind" ];
    };

    fileSystems."/nfs/music" = {
        device = "/mnt/big/music";
        options = [ "bind" ];
    };

    fileSystems."/nfs/archive" = {
        device = "/mnt/big/archive";
        options = [ "bind" ];
    };

    networking.firewall.allowedTCPPorts = [ 2049 ];
	services.nfs.server = {
    	enable = true;
    	exports = ''
			/nfs/photos  192.168.0.0/24(insecure,nohide,rw,sync,no_subtree_check,no_root_squash)
			/nfs/music   192.168.0.0/24(insecure,nohide,rw,sync,no_subtree_check,no_root_squash)
			/nfs/archive 192.168.0.0/24(insecure,nohide,rw,sync,no_subtree_check,no_root_squash)
    	'';
	};
}
