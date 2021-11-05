{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation rec {
	pname = "zathura-pywal";
	version = "2019-10-21";

	src = pkgs.fetchFromGitHub {
    	owner = "GideonWolfe";
    	repo = pname;
    	rev = "master";
    	sha256 = "0vwjvfamgcbgfjsv2rz8293fldjnqzf32nvra707cvp17cj6l0k5";
	};

	nativeBuildInputs = [
    	pkgs.zathura
	];

	dontBuild = true;
	installPhase = ''
		mkdir -p $out/bin
		chmod +x genzathurarc
		chmod +x zathura

		substituteInPlace zathura \
		    --replace "genzathurarc" "$out/bin/genzathurarc" \
			--replace "zathura --" "${pkgs.zathura}/bin/zathura --"

		cp genzathurarc $out/bin/
		cp zathura $out/bin/

		ln -s ${pkgs.zathura}/share $out/share
	'';
}
