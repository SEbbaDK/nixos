{ pkgs, config, ... }:
let
  hideLonelyTabs = builtins.readFile "${fetchTarball "https://github.com/MrOtherGuy/firefox-csshacks/archive/master.tar.gz"}/chrome/hide_tabs_with_one_tab.css";
in
{
  home-manager.main.programs.firefox = {
    enable = true;
    profiles = {
      ${config.users.main} = {
        id = 0;
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "about:blank";
          "browser.bookmarks.restore_default_bookmarks" = false;
          "browser.download.dir" = "/home/${config.users.main}/downloads";
          "browser.aboutConfig.showWarning" = false;
          "browser.tabs.warnOnClose" = false;
          "full-screen-api.ignore-widgets" = true; # This allows for fullscreen in frame
          "devtools.theme" = "dark";
        };
        userChrome = ''
        '';
      };
      app = {
        id = 1;
        settings = {
          "full-screen-api.ignore-widgets" = true; # This allows for fullscreen in frame
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # Enable userChrome
          "browser.toolbars.bookmarks.visibility" = "never"; # Kinda selfexplanatory no?
          "browser.startup.page" = 0; # Startup in blank window mode (don't try to restore)
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        };
        # userChrome = builtins.readFile "${fetchTarball "https://github.com/Etesam913/slick-fox/archive/master.tar.gz"}/userChrome.css";
        userChrome = ''
          #nav-bar { visibility: collapse !important; }
          ${hideLonelyTabs}
        '';
      };
    };
  };
}
