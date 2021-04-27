let
  pkgs = import <nixpkgs> { };
in
with pkgs; {
  screenshot = callPackage ./screenshot.nix { };
  nix-convert = callPackage ./nix-convert.nix { };
  uppaal = callPackage ./nix-convert.nix { };
  cdranger = callPackage ./cdranger.nix { };

  droidcam-obs-plugin = callPackage ./droidcam-obs-plugin.nix { };
  droidcam-obs-plugin-blobby = callPackage ./droidcam-obs-plugin-blobby.nix { };
}
