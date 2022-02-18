{ pkgs, ... }:
let
  secrets = import ../secrets;
  release = "nixos-21.11";
in
{
  imports = [
    (builtins.fetchTarball {
      url = "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/${release}/nixos-mailserver-${release}.tar.gz";
      sha256 = "1i56llz037x416bw698v8j6arvv622qc0vsycd20lx3yx8n77n44";
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
