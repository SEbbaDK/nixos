function git-kak-resolve
git status --porcelain | grep -E '^.U|^U' | sed 's/^...//g' | xargs kak
end
