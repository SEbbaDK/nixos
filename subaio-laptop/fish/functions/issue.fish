function issue
sglab issue view (sglab issue ls --assignee sebastian.hyberts --per-page 10000 | tail -n+2 | sed '/^$/d' | fzf | grep '#[0-9]*' -o) --comments
end
