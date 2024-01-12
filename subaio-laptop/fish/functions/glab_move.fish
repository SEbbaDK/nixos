function glab_move
    set issue (glab_issue)
    and set newlabel (echo Backlog\nNext\nExecute\nExecuted\nReview\nDeveloped\nTest\nDone | fzf --height ~10 --no-sort --tac)
    and sglab issue update --label WF::$newlabel $issue
end
