function glab_issue
glab_issues $argv | sed '/^$/d' | fzf --height ~20 --select-1 --ansi --no-sort --tac | grep -E "^#[0-9]+" -o --color=never
end
