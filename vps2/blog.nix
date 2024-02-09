let
    dbuser = "root";
    dbpass = "ghostpass";
    in
{ pkgs, ... }:
{
    services.nginx.virtualHosts."blog.sebba.dk" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
            proxyPass = "http://localhost:2368";
        };
    };
    
    virtualisation.oci-containers.containers.ghost = {
        hostname = "ghost";
        image = "docker.io/library/ghost:alpine";
        autoStart = true;
        ports = [ "127.0.0.1:2368:2368" ];
        volumes = [
            "/data/blog/content:/var/lib/ghost/content"
            #"/data/blog/config.production.json:/var/lib/ghost/config.production.json"
        ];
        environment = {
            url = "http://blog.sebba.dk";
            database__client = "mysql";
            database__connection__host = "ghost-db";
            database__connection__user = dbuser;
            database__connection__password = dbpass;
            database__connection__database = "ghost";
        };
        extraOptions = [ "--cap-add=NET_RAW" ];
    };

    virtualisation.oci-containers.containers.ghost-db = {
        hostname = "ghost-db";
        image = "docker.io/library/mariadb";
        autoStart = true;
        volumes = [ "/data/blog/db:/var/lib/mysql" ];
        environment = {
            MARIADB_ROOT_PASSWORD = dbpass;
        };
    };
}
