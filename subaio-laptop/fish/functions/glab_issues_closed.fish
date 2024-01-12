function glab_issues_closed
sglab issue ls --assignee sebastian.hyberts --not-label WF::Execute --not-label WF::Idea --not-label WF::Next --not-label WF::Backlog --not-label WF::Developed --not-label WF::Done | grep -E "^#[0-9]+" -o --color=never
end
