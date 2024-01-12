function glab_current_issue_branch
glab_current_issues | fzf --height ~5 --select-1 | grep -P "^[^\\t]*\\t[^\\t]*" -o | tr -d '#[](){}\t' | tr '_.:-' ' ' | tr ' ' '\-' | string lower
end
