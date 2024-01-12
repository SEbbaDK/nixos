function mkcd
set dir $argv[1]
[ "$dir" = "" ] && echo Give folder name as argument > /dev/stderr && exit 1
mkdir -p $dir
cd $dir
end
