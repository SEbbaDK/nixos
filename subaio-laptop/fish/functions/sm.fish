function sm
set path (subman) \
&& cd $path
if [ "$name" != "subman" ]
    exec nix-shell --run fish ../subman-shell.nix
end
end
