-- ****** Object: Stored Procedure SSO.AUTHENTICATE_LNKD_CALLBACK Script Date: 2/14/2012 8:14:52 AM ******
CREATE PROCEDURE authenticate_lnkd_callback
AS
   --con_str_http_method     CONSTANT VARCHAR2 (5) := 'POST';
   --con_str_oauth_api_url   CONSTANT VARCHAR2 (1000) := 'https://api.linkedin.com/uas/oauth/requestToken';
   --v_oauth_timestamp                VARCHAR2 (50);
   --v_oauth_nonce                    VARCHAR2 (50);
   --v_oauth_base_string              VARCHAR2 (1000);
   --v_obj_linkedin                   linkedin;
--BEGIN
   --v_obj_linkedin :=
      --NEW linkedin (id                      => USER,
                    --oauth_consumer_key      => global_constants.con_str_lnkd_consumer_key,
                    --oauth_consumer_secret   => global_constants.con_str_lnkd_consumer_secret,
                    --oauth_callback          => global_constants.con_str_lnkd_callback);
   ----
   --v_obj_linkedin.save;
   HTP.p ('v_obj_linkedin.oauth_api_authorization_url');
EXCEPTION
   WHEN OTHERS
   THEN
      SSO.error_handler.aspx (SQLCODE, SQLERRM, DBMS_UTILITY.format_error_backtrace);
END;
/
