function gbp
git branch --all | sed 's/^..//' | fzf
end
