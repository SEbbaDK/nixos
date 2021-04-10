let
  pkgs = import <nixpkgs> {};
in
{
  network = {
    inherit pkgs;
    description = "sebbadk-net";
    # ordering.tags = [ "local" "internet" ];
  };

  "10.0.0.2" = ./pi.nix;
  "135.181.47.140" = ./server.nix;
}
