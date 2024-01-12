function dir
fd . ~ --type d --hidden $argv | fzf --height ~10
end
