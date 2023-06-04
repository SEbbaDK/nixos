let
    dbpass = "photoprism";
in
{
    virtualisation.oci-containers.containers = {
        photoprism = {
            image = "photoprism/photoprism:latest";
            ports = [ "2342:2342" ];
            dependsOn = [ "photoprism-db" ];
            workdir = "/photoprism";
            environment = {
                PHOTOPRISM_READONLY = "true";
                PHOTOPRISM_SITE_URL = "127.0.0.1:2342";
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
