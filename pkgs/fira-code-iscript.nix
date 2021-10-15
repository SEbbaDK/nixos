{ pkgs ? import <nixpkgs> {}
, mkDerivation ? pkgs.stdenv.mkDerivation
, fetchFromGitHub ? pkgs.fetchFromGitHub
}:
mkDerivation {
    pname = "fira-code-iscript";
    version = "2017.09.24";

    src = fetchFromGitHub {
        owner = "kencrocken";
        repo = "FiraCodeiScript";
        rev = "f87318c072f1d9c7d075b1f702c3e4dd4df76a15";
        sha256 = "0y47ylcab2pzhy46h441whg4fd5dgvmmi3c7j6jh92d0lsddapdn";
    };

    dontBuild = true;
    installPhase = ''
    	mkdir -p $out/share/fonts/truetype
		mv *.ttf $out/share/fonts/truetype/
    '';
}
