{
    networking.firewall.allowedTCPPorts = [ 8123 ];
    virtualisation.oci-containers.containers.homeassistant = {
        volumes = [ "/container/home-assistant:/config" ];
        environment.TZ = "Europe/Copenhagen";
        image = "ghcr.io/home-assistant/home-assistant:stable"; # Warning: if the tag does not change, the image will not be updated
        extraOptions = [
            "--network=host"
            #"--device=/dev/ttyACM0:/dev/ttyACM0"  # Example, change this to match your own hardware
        ];
    };
}

