function glab_current_issues
sglab issue ls --assignee sebastian.hyberts --label WF::Execute --per-page 1000 \
	| sed -e '/^$/d' -e 's![\t ]*subaio/internal/subscriptionmanagement#[0-9]* *! !g' \
	| tail -n +2
end
