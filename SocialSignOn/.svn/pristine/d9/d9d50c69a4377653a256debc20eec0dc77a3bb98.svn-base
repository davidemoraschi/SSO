-- ****** Object: Object SSO.OAUTH Script Date: 2/14/2012 8:14:06 AM ******
CREATE TYPE OAUTH AS OBJECT
                  (id VARCHAR2 (250),
                   oauth_api_request_token_url VARCHAR2 (2000),
                   oauth_api_authorization_url VARCHAR2 (2000),
                   oauth_api_access_token_url VARCHAR2 (2000),
                   oauth_consumer_key VARCHAR2 (500),
                   oauth_consumer_secret VARCHAR2 (500),
                   oauth_request_token VARCHAR2 (500),
                   oauth_request_token_secret VARCHAR2 (500),
                   oauth_access_token VARCHAR2 (500),
                   oauth_access_token_secret VARCHAR2 (500),
                   oauth_verifier VARCHAR2 (50),
                   oauth_nonce VARCHAR2 (50),
                   oauth_timestamp VARCHAR2 (50),
                   oauth_base_string VARCHAR2 (1000),
                   oauth_signature VARCHAR2 (100),
                   var_http_authorization_header VARCHAR2 (2000),
                   con_num_timestamp_tz_diff NUMBER,
                   MEMBER FUNCTION base_string (p_http_method         IN VARCHAR2 DEFAULT 'GET',
                                                p_request_token_url   IN VARCHAR2,
                                                p_callback_url        IN VARCHAR2 DEFAULT 'oob',
                                                p_consumer_key        IN VARCHAR2,
                                                p_timestamp           IN VARCHAR2,
                                                p_nonce               IN VARCHAR2,
                                                p_token               IN VARCHAR2 DEFAULT NULL,
                                                p_token_verifier      IN VARCHAR2 DEFAULT NULL)
                      RETURN VARCHAR2,
                   MEMBER FUNCTION base_string2 (p_http_method         IN VARCHAR2 DEFAULT 'GET',
                                                 p_request_token_url   IN VARCHAR2,
                                                 p_callback_url        IN VARCHAR2 DEFAULT 'oob',
                                                 p_consumer_key        IN VARCHAR2,
                                                 p_timestamp           IN VARCHAR2,
                                                 p_nonce               IN VARCHAR2,
                                                 p_token               IN VARCHAR2 DEFAULT NULL,
                                                 p_token_verifier      IN VARCHAR2 DEFAULT NULL)
                      RETURN VARCHAR2,
                   MEMBER FUNCTION signature (p_oauth_base_string IN VARCHAR2, p_oauth_key IN VARCHAR2)
                      RETURN VARCHAR2,
                   MEMBER FUNCTION key_token (p_consumer_secret IN VARCHAR2, p_token_secret IN VARCHAR2)
                      RETURN VARCHAR2,
                   MEMBER FUNCTION authorization_header (p_callback_url   IN VARCHAR2 DEFAULT NULL,
                                                         p_consumer_key   IN VARCHAR2,
                                                         p_timestamp      IN VARCHAR2,
                                                         p_nonce          IN VARCHAR2,
                                                         p_signature      IN VARCHAR2,
                                                         p_token          IN VARCHAR2 DEFAULT NULL,
                                                         p_verifier       IN VARCHAR2 DEFAULT NULL)
                      RETURN VARCHAR2,
                   MEMBER FUNCTION urlencode (p_str IN VARCHAR2)
                      RETURN VARCHAR2,
                   MEMBER FUNCTION token_extract (p_str IN VARCHAR2, p_pat IN VARCHAR2, p_delim IN VARCHAR2 := '&')
                      RETURN VARCHAR2,
                   MEMBER FUNCTION VERSION
                      RETURN VARCHAR2)
                     NOT INSTANTIABLE
                     NOT FINAL;
/
