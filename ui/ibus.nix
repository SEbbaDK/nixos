{ pkgs, ... }:
{
  i18n.inputMethod.enabled = "ibus";
  i18n.inputMethod.ibus.engines = with pkgs.ibus-engines; [
    hangul
    table
    table-chinese
    table-others
    uniemoji
  ];
}
