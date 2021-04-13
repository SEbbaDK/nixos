let
  pkgs = import <nixpkgs> {};
in
{
  network = {
    inherit pkgs;
    description = "sebbadk-net";
  };

  "10.0.0.2" = { ... }:
  {
    imports = [ ./pi.nix ];
    deployment.targetEnv = 
  };
}
