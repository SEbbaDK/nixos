{ pkgs ? import <nixpkgs> { }
, callPackage ? pkgs.callPackage
}:
{
  screenshot = callPackage ./screenshot.nix { };
  nix-convert = callPackage ./nix-convert.nix { };
  uppaal = callPackage ./nix-convert.nix { };
  cdranger = callPackage ./cdranger.nix { };
  stregsystem = callPackage (fetchTarball "https://github.com/f-klubben/stregsystemet-cli/archive/master.tar.gz") { };

  droidcam-obs-plugin = callPackage ./droidcam-obs-plugin.nix { };
  droidcam-obs-plugin-blobby = callPackage ./droidcam-obs-plugin-blobby.nix { };

  fira-code-iscript = callPackage ./fira-code-iscript.nix { };
  fira-code-victor = callPackage ./fira-code-victor.nix { };
}
