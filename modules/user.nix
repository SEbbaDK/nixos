{ config, lib, ... }:
{
    options = with lib; {
        users.main = mkOption {
            type = types.str;
            default = "user";
            description = "Set the main user of the system";
        };

        home-manager.main = mkOption {
			type = types.anything;
			default = {};
			description = "The home-manager configuration for the main user";
        };
    };

    config = {
        home-manager.users.${config.users.main} = config.home-manager.main;
    };
}
