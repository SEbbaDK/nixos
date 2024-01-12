function f
set TARGET (fd . $argv[1] --type f --hidden $argv[2..] | fzf --multi --height ~20 --preview 'bat --style numbers --line-range 0:100 --color=always {}')
[ "$TARGET" != "" ] && kak $TARGET
end
