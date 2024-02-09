{
    virtualisation.oci-containers.containers.radicale = {
        image = "tomsquest/docker-radicale";
        autoStart = true;
        ports = [ "127.0.0.1:5232:5232" ];
        volumes = [ "/data/radicale:/data" ];
    };
}
