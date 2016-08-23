-- ****** Object: Package Body SSO.AUTHENTICATE_LNKD Script Date: 2/14/2012 7:54:04 AM ******
CREATE PACKAGE BODY authenticate_lnkd
IS
   PROCEDURE jsp (originalurl IN VARCHAR2)
   IS
      v_originalurl    VARCHAR2 (32000) := originalurl;
      v_obj_linkedin   linkedin;
   BEGIN
      v_obj_linkedin :=
         NEW linkedin (id                      => USER,
                       oauth_consumer_key      => global_constants.con_str_lnkd_consumer_key,
                       oauth_consumer_secret   => global_constants.con_str_lnkd_consumer_secret,
                       oauth_callback          => global_constants.con_str_lnkd_callback);
      --
      v_obj_linkedin.save;
      --HTP.p (v_obj_linkedin.oauth_base_string);
      HTP.p ('<script type="text/javascript">window.location = "' || v_obj_linkedin.oauth_api_authorization_url || '"</script>');
      HTP.p ('<a href="' || v_obj_linkedin.oauth_api_authorization_url || '">This page uses javascript redirection, if you''re not redirected please click here</a>');
   EXCEPTION
      WHEN OTHERS
      THEN
         SSO.error_handler.aspx (SQLCODE, SQLERRM, DBMS_UTILITY.format_error_backtrace);
   END;
END;
/
