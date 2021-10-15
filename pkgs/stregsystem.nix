{ pkgs ? import <nixpkgs> {}
, fetchFromGitHub ? pkgs.fetchFromGitHub
, python ? pkgs.python39
, mkDerivation ? pkgs.stdenv.mkDerivation
}:
mkDerivation {
    name = "stregsystem-cli";
    src = fetchFromGitHub {
        owner = "f-klubben";
        repo = "stregsystemet-cli";
        rev = "298cac347d0f94666cb54a47f5296a96b7a07a24";
        sha256 = "0kk04xn712wp6ys3yvpn80lhnd4bzbmz4k981j77l51j4qm6csmy";
    };

	buildInputs = [
    	(python.withPackages (pypkgs: [ pypkgs.requests ]))
	];
    
    buildPhase = "";
    installPhase = ''
    	mkdir -p $out/bin
		cp main.py $out/bin/sts
		chmod +x $out/bin/sts
	'';
}
