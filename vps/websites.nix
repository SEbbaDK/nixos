{ pkgs, config, lib, ... }:
with builtins;
let
  source = fetchGit {
    url = "git@github.com:sebbadk/websites.git";
    rev = "70e332cba6645111e963668ee718e6e9ab2f2e00";
  };
  phpLoc = {
    "~ \\.php$".extraConfig = ''
      fastcgi_split_path_info ^(.+\.php)(/.+)$;
      fastcgi_pass unix:${config.services.phpfpm.pools."${app}".socket};
    '';
  };
  vhostmap = f: sets: listToAttrs (map (name: { inherit name; value = f sets.${name}; }) (builtins.attrNames sets));
  phpEnableRemover = vhostmap (vhost: builtins.removeAttrs vhost [ "enablePHP" ]);
  phpEnabler = vhostmap (vhost:
    if (vhost.enablePHP or false)
    then (vhost // { locations = vhost.locations // phpLoc; })
    else vhost
  );
  vhosts = phpEnableRemover (phpEnabler (import "${source}/vhosts.nix" { inherit pkgs; }));
  app = "webhosting";
in
{
  networking.firewall.allowedTCPPorts = [ 80 443 ];
  services.nginx = {
    enable = true;
    virtualHosts = vhosts;
  };
  services.phpfpm.pools."${app}" = {
    user = app;
    settings = {
      "listen.owner" = config.services.nginx.user;
      "pm" = "dynamic";
      "pm.max_children" = 5;
      "pm.start_servers" = 2;
      "pm.min_spare_servers" = 1;
      "pm.max_spare_servers" = 3;
      "pm.max_requests" = 500;
      "php_admin_value[error_log]" = "stderr";
      "php_admin_flag[log_errors]" = true;
      "catch_workers_output" = true;
    };
    phpEnv."PATH" = lib.makeBinPath [ pkgs.php ];
  };
  users.users.${app} = {
    isSystemUser = true;
    createHome = true;
    home = "/home/${app}";
    group = app;
  };
  users.groups.${app} = { };
}
