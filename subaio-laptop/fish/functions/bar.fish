function bar
set tasks (glab_current_issues | awk -v FS='\t' -v OFS='\t' '{ print $1 $2 }' | string join ' & ')
[ "$tasks" != "" ] && echo "👷 $tasks | "
set wifi (nmcli connection show --active | grep wifi | grep "^.*[\\t]" -o | string trim)
[ "$wifi" != "" ] && echo "📶 $wifi | "
echo -n 🔋 (upower -i $(upower -e | grep BAT) | grep percentage | grep "[0-9]*%" -o | cat)
echo -n ' | '
set sound_icon '🔊'
[ (pamixer --get-mute) = 'true' ] && set sound_icon '🔇'
echo -n $sound_icon (pamixer --get-volume-human)
echo -n ' | '
date +'%Y-%m-%d %H:%M:%S %p'
end
