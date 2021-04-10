{ pkgs, ... }:
{
  security.acme.acceptTerms = true;
  security.acme.email = secrets.acme;
}
