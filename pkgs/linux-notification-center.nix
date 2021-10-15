{ pkgs ? import <nixpkgs> {}
, mkDerivation ? pkgs.stdenv.mkDerivation
, fetchFromGitHub ? pkgs.fetchFromGitHub
}:
mkDerivation rec {
    pname = "linux_notification_center";
    version = "1.7.3";

    src = fetchFromGitHub {
        owner = "phuhl";
        repo = pname;
        rev = version;
        sha256 = "06adfsrkajh72iyn27lw1jp93hf8nn9yir1a7962hhv1v6p8p8s1";
    };

    buildInputs = [
        pkgs.ghc
		pkgs.stack
    ];
}
