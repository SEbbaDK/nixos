{ pkgs, ... }:
let
  secrets = import ../secrets;
in
{
  imports = [
    (builtins.fetchTarball {
      url = "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/nixos-20.09/nixos-mailserver-nixos-20.09.tar.gz";
      sha256 = "0vsvgxxg5cgmzwj98171j7h5l028f1yq784alb3lxgbk8znfk51y";
    })
  ];

  mailserver = {
    enable = true;
    fqdn = "mail.sebba.dk";
    domains = secrets.mail.domains;
    loginAccounts = secrets.mail.accounts;
    certificateScheme = 3;
    enableImapSsl = true;
    enablePop3Ssl = true;
  };

  services.roundcube = {
    enable = true;
    hostName = secrets.mail.roundcube;
    extraConfig = ''
      $config['default_host'] = 'localhost';
      $config['smtp_port'] = 25;
      $config['smtp_user'] = "";
      $config['smtp_pass'] = "";
    '';
  };
}
