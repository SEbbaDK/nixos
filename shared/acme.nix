let
    secrets = import ../secrets;
in
{
	security.acme = {
    	acceptTerms = true;
    	defaults.email = secrets.acmeMail;
	};
}
