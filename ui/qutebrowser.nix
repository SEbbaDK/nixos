let
  user = import ../user.nix;
in
{
  home-manager.users.${user}.programs.qutebrowser = {
    enable = true;
    settings = {
      colors.webpage.darkmode.enabled = true;
    };
    searchEngines = {
		np = "https://search.nixos.org/packages?query={}";
		no = "https://search.nixos.org/options?query={}";
    };
  };
}
