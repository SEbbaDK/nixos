function 2fa_prompt
2fa | awk '{ print $2 }' | wofi --show dmenu --location top | xargs 2fa | wl-copy --trim-newline
end
