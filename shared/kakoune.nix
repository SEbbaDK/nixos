{ pkgs, ... }:
let
  config = pkgs.writeTextFile (rec {
    name = "kakrc.kak";
    destination = "/share/kak/autoload/${name}";
    text = ''
      add-highlighter global/ number-lines
      add-highlighter global/ wrap
      terminal_enable_mouse=false
      terminal_change_colors=false
      eval %sh{kak-lsp --kakoune -s $kak_session}
      lsp-enable-window
      kakboard-disable
    '';
  });
  plugins = with pkgs.kakounePlugins; [
    kakoune-buffers
    fzf-kak
    kakoune-lsp
    pandoc-kak
    tabs-kak
    kakboard
  ];
in
{
  environment.variables.EDITOR = "kak";

  #environment.systemPackages = [
  #  (pkgs.kakoune.override {
  #    plugins = [ config ] ++ plugins;
  #  })
  #];

  home-manager.main.programs.kakoune = {
    enable = true;
    plugins = plugins;
    config = {
      numberLines.enable = true;
      tabStop = 4;
      ui.changeColors = false;
      wrapLines = {
        enable = true;
        indent = true;
        marker = "⏎";
        word = true;
      };
      hooks = [
        # This hook is removed because kakboard breaks multicursor copying
        #{ name = "WinCreate"; option = ".*"; commands = "kakboard-enable"; }
      ];
    };
    extraConfig = ''
      eval %sh{kak-lsp --kakoune -s $kak_session}
    '';
  };
}
