{ pkgs, ... }:
let
  secrets = import ../secrets;
in
{
  imports = [
    (builtins.fetchTarball {
      url = "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/master/nixos-mailserver-master.tar.gz";
      sha256 = "1fllk14cqkpjwmf6nsy6mknn4gvxwqcl4ysyh5hxpn6axwfwjvnf";
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
