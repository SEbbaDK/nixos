{ pkgs, ... }:
let
	user = "tunnel";
	tunnelCommand = builtins.concatStringsSep " " [
        "${pkgs.openssh}/bin/ssh"
        "-o ServerAliveInterval=30"
        "-o ServerAliveCountMax=2"
        "-o ExitOnForwardFailure=True"
        "-R 2200:localhost:22"
        "-i /home/${user}/.ssh/id_rsa"
        "-N"
        "tunnel@sebba.dk"
	];
in
{
	users.extraUsers.${user} = {
		isSystemUser = true;
		createHome = true;
		home = "/home/${user}";
	};

	systemd.services.tunnel = {
		description = "SSH Tunnel to sebba.dk";
		serviceConfig = {
    		User = user;
    		ExecStart = tunnelCommand;

    		# Restart forever
    		Restart = "on-failure";
			StartLimitIntervalSec = 0;
			RestartSec = 30;
		};
		requires = [
    		"network-online.target" # We want to be online
    		"nss-lookup.target" # We want to use dns
		];
		wantedBy = [ "default.target" ];
	};
}
