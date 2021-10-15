{ pkgs, ... }:
let
  secrets = import ../secrets;
  release = "nixos-21.05";
in
{
  imports = [
    (builtins.fetchTarball {
      url = "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/${release}/nixos-mailserver-${release}.tar.gz";
      sha256 = "1fwhb7a5v9c98nzhf3dyqf3a5ianqh7k50zizj8v5nmj3blxw4pi";
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
