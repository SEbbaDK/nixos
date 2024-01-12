function glab_issues_open
sglab issue ls --assignee sebastian.hyberts --not-label WF::Executed --not-label WF::Idea --not-label WF::Proposal --not-label WF::Review --not-label WF::Developed --not-label WF::Done | grep -E "^#[0-9]+" -o --color=never
end
