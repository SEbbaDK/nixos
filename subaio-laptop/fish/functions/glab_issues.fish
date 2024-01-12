function glab_issues
if contains -- "--team" $argv
    set args --per-page 100 --label Team::Platform
else if contains -- "--all" $argv
    set args --per-page 100
else
    set args --per-page 100 --assignee sebastian.hyberts
end

set issues (sglab issue list $args | awk -v FS='\t' -v OFS='\t' '{ print "\033[1m"$1"\033[m  "$3"    \033[2m\033[3m\033[90m"$4" "$5"\033[m" }')

echo -e '\e[42m\e[30m\e[1mBacklog\e[m'
printf '%s\n' $issues | grep -E --color=never "WF::Backlog\b"
echo

echo -e '\e[42m\e[30m\e[1mNext\e[m'
printf '%s\n' $issues | grep -E --color=never "WF::Next\b"
echo

echo -e '\e[42m\e[30m\e[1mExecute\e[m'
printf '%s\n' $issues | grep -E --color=never "WF::Execute\b"
echo

echo -e '\e[42m\e[30m\e[1mExecuted\e[m'
printf '%s\n' $issues | grep -E --color=never "WF::Executed\b"
echo

echo -e '\e[42m\e[30m\e[1mReview\e[m'
printf '%s\n' $issues | grep -E --color=never "WF::Review\b"
echo

echo -e '\e[42m\e[30m\e[1mTest\e[m'
printf '%s\n' $issues | grep -E --color=never "WF::Test\b"
echo

end
