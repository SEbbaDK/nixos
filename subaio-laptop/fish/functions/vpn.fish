function vpn
echo (lpass show --password vpn)(nix-shell -p go-2fa --run '2fa vpn') | wl-copy --trim-newline --paste-once && nmcli connection up subaio --ask
end
