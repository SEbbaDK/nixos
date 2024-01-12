function glp
set --function args --decorate --oneline --graph --color=always
if [ (count $argv) = 0 ]
    set --function --append args --remotes --branches
end
git log $args | fzf --reverse --ansi --height ~20 | grep -E '[^ ]{7}' -o | head -n 1
end
