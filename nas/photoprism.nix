let
    dbpass = "photoprism";
in
{
	networking.firewall.allowedTCPPorts = [ 80 443 ];
	networking.firewall.allowedUDPPorts = [ 80 443 ];

	services.nginx.enable = true;
	services.nginx.virtualHosts."photoprism.sebba.dk" = {
		forceSSL = true;
		enableACME = true;
		extraConfig = ''
			ssl_client_certificate ${../secrets/ssl/ca.crt};
			ssl_verify_client on;
			client_max_body_size 500M;
		'';
		locations."/" = {
    		proxyPass = "http://localhost:2342/";
    		recommendedProxySettings = true;
    		proxyWebsockets = true;
		};
	};

    virtualisation.oci-containers.containers = {
        photoprism = {
            image = "photoprism/photoprism:240711";
            ports = [ "2342:2342" ];
            dependsOn = [ "photoprism-db" ];
            workdir = "/photoprism";
            environment = {
                PHOTOPRISM_READONLY = "true";
                PHOTOPRISM_SITE_URL = "https://photoprism.sebba.dk";
                PHOTOPRISM_DISABLE_TLS = "true";
                PHOTOPRISM_ORIGINALS_LIMIT = "5000";
                PHOTOPRISM_ADMIN_USER = "sebbadk";
                PHOTOPRISM_ADMIN_PASSWORD = "photoprism";
                PHOTOPRISM_DATABASE_DRIVER = "mysql";
                PHOTOPRISM_DATABASE_SERVER = "photoprism-db:3306";
                PHOTOPRISM_DATABASE_NAME = "photoprism";
                PHOTOPRISM_DATABASE_USER = "root";
                PHOTOPRISM_DATABASE_PASSWORD = dbpass;
            };
            volumes = [
                "/mnt/big/photos:/photoprism/originals:ro"
                "/container/photoprism:/photoprism/storage"
            ];
            extraOptions = [
                "--link=photoprism-db"
            ];
        };

        photoprism-db = {
            image = "mariadb:latest";
            environment = {
                MARIADB_AUTO_UPGRADE = "1";
                MARIADB_ROOT_PASSWORD = dbpass;
                MARIADB_DATABASE = "photoprism";
            };
            volumes = [
                "/container/photoprism-db:/var/lib/mysql"
            ];
        };
    };
}
