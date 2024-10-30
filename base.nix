{ hostname
, ui
, deviceImports
, version
, swap ? 0
}:
{ pkgs, ... }:
let
  optional = pkgs.lib.optional;
in
{
  imports = deviceImports ++ [ ./shared ] ++ (if ui then [ ./ui ] else [ ]);

  networking.hostName = hostname;

  system.stateVersion = version;
  home-manager.main.home.stateVersion = version;

  swapDevices = optional
    (swap > 0)
    { device = "/swap"; size = 1024 * swap; };
}

