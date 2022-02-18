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
		nxp = "https://search.nixos.org/packages?query={}";
		nxo = "https://search.nixos.org/options?query={}";
		y = "https://youtube.com/results?search_query={}";
		r = "https://old.reddit.com/r/{}";
		gh = "https://github.com/{}";
		ew = "https://en.wikipedia.org/wiki/{}";
		dw = "https://da.wikipedia.org/wiki/{}";
		pub = "https://pub.dev/packages/{}";
		sch = "https://scholar.google.com/scholar?q={}";
		dblp = "https://dblp.uni-trier.de/search?q={}";
    };
    keyBindings.normal = {
		"gj" = "scroll-to-perc";
		"gk" = "scroll-to-perc 0";
    };
  };
}
