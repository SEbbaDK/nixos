{ path, ... }:
writeScriptBin "uppaal" ''nix-shell -p jre --run "${path}/uppaal"''
