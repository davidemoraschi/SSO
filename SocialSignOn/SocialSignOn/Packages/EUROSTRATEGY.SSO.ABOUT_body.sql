-- ****** Object: Package Body SSO.ABOUT Script Date: 2/14/2012 7:53:12 AM ******
CREATE PACKAGE BODY about
IS
   PROCEDURE jsp
   IS
   BEGIN
      HTP.htmlOpen;
      HTP.headOpen;
      HTP.title ('Environment Test');
      HTP.headClose;
      HTP.bodyOpen;
      HTP.hr;
      HTP.br;
      HTP.p ('REMOTE_ADDR=' || OWA_UTIL.get_cgi_env ('REMOTE_ADDR'));
      HTP.br;
      HTP.p ('REMOTE_USER=' || OWA_UTIL.get_cgi_env ('REMOTE_USER'));
      HTP.br;
      HTP.p ('HTTP_HOST=' || OWA_UTIL.get_cgi_env ('HTTP_HOST'));
      HTP.br;
      HTP.p ('SERVER_NAME=' || OWA_UTIL.get_cgi_env ('SERVER_NAME'));
      HTP.br;
      HTP.p ('SERVER_PORT=' || OWA_UTIL.get_cgi_env ('SERVER_PORT'));
      HTP.br;
      HTP.p (
         'owa_util.GET_OWA_SERVICE_PATH=' || OWA_UTIL.get_owa_service_path);
      HTP.br;
      HTP.p ('owa_sec.get_user_id=' || OWA_SEC.get_user_id);
      HTP.br;
      HTP.p ('owa_sec.get_password=' || OWA_SEC.get_password);
      HTP.br;
      HTP.p ('<H1>All CGI Environment variables...</H1>');
      OWA_UTIL.print_cgi_env;
      HTP.bodyClose;
      HTP.htmlClose;
   END;
END;
/
