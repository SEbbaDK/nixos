{ pkgs ? import <nixpkgs> {} }:
let
  plugin = pkgs.fetchzip {
    url = "https://files.dev47apps.net/obs/droidcam_obs_1.2.1_linux.zip";
    sha256 = "167i9dw3c7x2xp5xx0aqblrn6m28sdspmwkqwli1mnwc625rhhw1";
    stripRoot = false;
  };
in
pkgs.runCommand "droidcam-obs-plugin" {} ''
  mkdir -p $out/share/obs/obs-plugins
  cp -r "${plugin}/droidcam-obs" $out/share/obs/obs-plugins/droidcam-obs
''
