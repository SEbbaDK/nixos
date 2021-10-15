{ pkgs ? import <nixpkgs> {}
, mkDerivation ? pkgs.stdenv.mkDerivation
, fetchFromGitHub ? pkgs.fetchFromGitHub
, runCommand ? pkgs.runCommand
, fira-code ? pkgs.fira-code
, victor-mono ? pkgs.victor-mono
, fonttools ? pkgs.python39Packages.fonttools
}:
let
	ttxify = font: name: runCommand "${name}-ttx" {} ''
		mkdir $out
		# For some reason ttx tries to open the file in append mode
		cp ${font} target.ttf
    	${fonttools}/bin/ttx -o - target.ttf > $out/${name}.ttx
	'';
	convert = font: name: runCommand "${name}-converted" {} ''
		mkdir $out
		sed \
			-e "s/FiraCode-Light/FiraCodeVictor-Light/g" \
			-e "s/Fira Code Light/Fira Code Victor Light/g" \
			-e "s/VictorMono-LightItalic/FiraCodeVictor-LightItalic/g" \
			-e "s/Victor Mono Light Italic/Fira Code Victor Light Italic/g" \
			< ${font}/${name}.ttx > $out/${name}.ttx
	'';
	ttfify = font: name: runCommand "${name}-ttf" {} ''
		mkdir $out
		${fonttools}/bin/ttx -o - ${font}/* > $out/${name}.ttf
	'';
	fix = font: name: (ttfify (convert (ttxify font name) name) name);
in
mkDerivation {
    pname = "fira-code-victor";
    version = "v1.0";

	srcs = [
		(fix "${fira-code}/share/fonts/truetype/FiraCode-VF.ttf" "fira-code-victor-light")
		(fix "${victor-mono}/share/fonts/truetype/victor-mono/VictorMono-Light.ttf" "fira-code-victor-lightitalic")
	];

	dontUnpack = true;
    dontBuild = true;
    installPhase = ''
    	mkdir -p $out/share/fonts/truetype
		for f in $srcs
		do
			ln -s "$f"/* $out/share/fonts/truetype/
		done
    '';
}
