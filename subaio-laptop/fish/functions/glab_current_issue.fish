function glab_current_issue
  glab_current_issues | fzf --height ~5 --select-1 | grep -E "^#[0-9]+" -o --color=never
end
