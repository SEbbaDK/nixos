function glab_next_issue
sglab issue ls --assignee sebastian.hyberts --label WF::Next | grep -E "^#[0-9]+" -o --color=never
end
