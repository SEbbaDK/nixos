let
  secrets = import ../secrets;
in
{
  security.acme.acceptTerms = true;
  security.acme.email = secrets.acme;
}
