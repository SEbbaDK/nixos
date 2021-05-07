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
		y = "https://youtube.com/results?search_query={}";
		r = "https://old.reddit.com/r/{}";
		gh = "https://github.com/{}";
		ew = "https://en.wikipedia.org/wiki/{}";
		dw = "https://da.wikipedia.org/wiki/{}";
		pub = "https://pub.dev/packages/{}";
    };
  };
}
