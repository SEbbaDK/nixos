function subman
set submans (find ~/code/ -maxdepth 1 -type d -name "subman*")
printf "%s\n" $submans | fzf --height ~20 --select-1 --ansi --no-sort --tac
end
