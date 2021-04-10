let
  user = import ../user.nix;
in
{ pkgs, ... }:
{
  boot.loader.grub = {
    #extraConfig = "set theme=(hd0,1)${pkgs.breeze-grub}/grub/themes/breeze/theme.txt";
    extraConfig = "set theme=(hd0,1)/home/${user}/software/breeze/breeze/theme.txt";
    splashImage = null;
  };
}
