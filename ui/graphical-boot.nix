let
  user = import ../user.nix;
  nixos-artwork = (fetchTarball "https://github.com/NixOS/nixos-artwork/archive/master.tar.gz");
in
{
  boot.loader.grub = {
    # extraConfig = "set theme=(hd0,1)${pkgs.breeze-grub}/grub/themes/breeze/theme.txt";
    # extraConfig = "set theme=(hd0,1)/home/${user}/software/breeze/breeze/theme.txt";
    # extraConfig = "set theme=(hd0,1)${pkgs.writeText "theme" ''
    #   desktop-image: "${image}"
    # ''}";
    # splashImage = null;
    splashImage = "${nixos-artwork}/wallpapers/nix-wallpaper-stripes-logo.png";
    extraConfig = "timeout=1";
    # extraConfig = ''
    #   timeout=1
    #   timeout_style=hidden
    # '';
  };
}
