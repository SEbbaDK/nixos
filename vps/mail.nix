{ pkgs, ... }:
let
  secrets = import ../secrets;
  release = "nixos-24.05";
in
{
  imports = [
    (builtins.fetchTarball {
      url = "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/${release}/nixos-mailserver-${release}.tar.gz";
      sha256 = "0clvw4622mqzk1aqw1qn6shl9pai097q62mq1ibzscnjayhp278b";
    })
  ];

  mailserver = {
    enable = true;
    fqdn = "mail.sebba.dk";
    domains = secrets.mail.domains;
    loginAccounts = secrets.mail.accounts;
    certificateScheme = "acme-nginx";
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
