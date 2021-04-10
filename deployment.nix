let
  pkgs = import <nixpkgs> {};
in
{
  network = {
    inherit pkgs;
    description = "sebbadk-net";
  };

  "10.0.0.2" = ./pi.nix;
}
