{ pkgs, ... }:
{
  i18n.inputMethod.enabled = "fcitx";
  i18n.inputMethod.ibus.engines = with pkgs.fcitx5; [
    chewing
    hangul
    table-extra
    table-others
  ];
}
