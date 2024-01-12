function lpass_prompt
lpass ls > /dev/null
lpass ls --format "%an" | string trim | wofi --show dmenu --location top | xargs lpass show --password | wl-copy
end
