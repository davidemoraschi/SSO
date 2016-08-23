-- ****** Object: UDT Type Body SSO.OAUTH Script Date: 2/14/2012 8:14:07 AM ******
CREATE TYPE BODY OAUTH
AS
   MEMBER FUNCTION base_string (p_http_method         IN VARCHAR2 DEFAULT 'GET',
                                p_request_token_url   IN VARCHAR2,
                                p_callback_url        IN VARCHAR2 DEFAULT 'oob',
                                p_consumer_key        IN VARCHAR2,
                                p_timestamp           IN VARCHAR2,
                                p_nonce               IN VARCHAR2,
                                p_token               IN VARCHAR2 DEFAULT NULL,
                                p_token_verifier      IN VARCHAR2 DEFAULT NULL)
      RETURN VARCHAR2
   IS
      v_oauth_base_string   VARCHAR2 (4000);
   BEGIN
      IF p_token IS NULL AND p_token_verifier IS NULL
      THEN
         v_oauth_base_string :=
            p_http_method || '&' || urlencode (p_request_token_url) || '&'
            || urlencode (
                     'oauth_callback'
                  || '='
                  || urlencode (p_callback_url)
                  || '&'
                  || 'oauth_consumer_key'
                  || '='
                  || urlencode (p_consumer_key)
                  || '&'
                  || 'oauth_nonce'
                  || '='
                  || p_nonce
                  || '&'
                  || 'oauth_signature_method'
                  || '='
                  || 'HMAC-SHA1'
                  || '&'
                  || 'oauth_timestamp'
                  || '='
                  || p_timestamp
                  || '&'
                  || 'oauth_version'
                  || '='
                  || '1.0');
      ELSE
         IF p_token IS NOT NULL AND p_token_verifier IS NOT NULL
         THEN
            v_oauth_base_string :=
               p_http_method || '&' || urlencode (p_request_token_url) || '&'
               || urlencode (
                        'oauth_consumer_key'
                     || '='
                     || urlencode (p_consumer_key)
                     || '&'
                     || 'oauth_nonce'
                     || '='
                     || p_nonce
                     || '&'
                     || 'oauth_signature_method'
                     || '='
                     || 'HMAC-SHA1'
                     || '&'
                     || 'oauth_timestamp'
                     || '='
                     || p_timestamp
                     || '&'
                     || 'oauth_token'
                     || '='
                     || urlencode (p_token)
                     || '&'
                     || 'oauth_verifier'
                     || '='
                     || p_token_verifier
                     || '&'
                     || 'oauth_version'
                     || '='
                     || '1.0');
         END IF;

         IF p_token IS NOT NULL AND p_token_verifier IS NULL
         THEN
            v_oauth_base_string :=
               p_http_method || '&' || urlencode (p_request_token_url) || '&'
               || urlencode (
                        'oauth_consumer_key'
                     || '='
                     || urlencode (p_consumer_key)
                     || '&'
                     || 'oauth_nonce'
                     || '='
                     || p_nonce
                     || '&'
                     || 'oauth_signature_method'
                     || '='
                     || 'HMAC-SHA1'
                     || '&'
                     || 'oauth_timestamp'
                     || '='
                     || p_timestamp
                     || '&'
                     || 'oauth_token'
                     || '='
                     || urlencode (p_token)
                     || '&'
                     || 'oauth_version'
                     || '='
                     || '1.0');
         END IF;
      END IF;

      RETURN v_oauth_base_string;
   END base_string;

   MEMBER FUNCTION base_string2 (p_http_method         IN VARCHAR2 DEFAULT 'GET',
                                 p_request_token_url   IN VARCHAR2,
                                 p_callback_url        IN VARCHAR2 DEFAULT 'oob',
                                 p_consumer_key        IN VARCHAR2,
                                 p_timestamp           IN VARCHAR2,
                                 p_nonce               IN VARCHAR2,
                                 p_token               IN VARCHAR2 DEFAULT NULL,
                                 p_token_verifier      IN VARCHAR2 DEFAULT NULL)
      RETURN VARCHAR2
   IS
      v_oauth_base_string            VARCHAR2 (4000);
      v_temp_base_string             VARCHAR2 (4000);

      TYPE typ_str_oauth_parameter_values IS TABLE OF VARCHAR2 (4000)
                                                INDEX BY VARCHAR2 (250);

      v_str_oauth_parameter_values   typ_str_oauth_parameter_values;
      v_idx                          VARCHAR2 (250);
   BEGIN
      IF p_callback_url IS NOT NULL
      THEN
         v_str_oauth_parameter_values ('oauth_callback') := urlencode (p_callback_url);
      END IF;

      v_str_oauth_parameter_values ('oauth_consumer_key') := urlencode (p_consumer_key);
      v_str_oauth_parameter_values ('oauth_nonce') := p_nonce;
      v_str_oauth_parameter_values ('oauth_signature_method') := 'HMAC-SHA1';
      v_str_oauth_parameter_values ('oauth_timestamp') := p_timestamp;

      IF p_token IS NOT NULL
      THEN
         v_str_oauth_parameter_values ('oauth_token') := urlencode (p_token);
      END IF;

      IF p_token_verifier IS NOT NULL
      THEN
         v_str_oauth_parameter_values ('oauth_verifier') := p_token_verifier;
      END IF;

      v_str_oauth_parameter_values ('oauth_version') := '1.0';
      v_idx := v_str_oauth_parameter_values.FIRST;

      LOOP
         v_temp_base_string := v_temp_base_string || v_idx || '=' || v_str_oauth_parameter_values (v_idx);
         v_idx := v_str_oauth_parameter_values.NEXT (v_idx);

         IF v_idx IS NOT NULL
         THEN
            v_temp_base_string := v_temp_base_string || '&';
         END IF;

         EXIT WHEN v_idx IS NULL;
      END LOOP;

      v_oauth_base_string := p_http_method || '&' || urlencode (p_request_token_url) || '&' || urlencode (v_temp_base_string);
      RETURN v_oauth_base_string;
   END base_string2;

   MEMBER FUNCTION signature (p_oauth_base_string IN VARCHAR2, p_oauth_key IN VARCHAR2)
      RETURN VARCHAR2
   AS
      v_oauth_signature   VARCHAR2 (1000);
   BEGIN
      v_oauth_signature :=
         UTL_RAW.cast_to_varchar2 (
            UTL_ENCODE.base64_encode (
               DBMS_CRYPTO.mac (UTL_I18N.string_to_raw (p_oauth_base_string, 'AL32UTF8'), DBMS_CRYPTO.hmac_sh1, UTL_I18N.string_to_raw (p_oauth_key, 'AL32UTF8'))));
      RETURN v_oauth_signature;
   END signature;

   MEMBER FUNCTION key_token (p_consumer_secret IN VARCHAR2, p_token_secret IN VARCHAR2)
      RETURN VARCHAR2
   AS
      v_oauth_key   VARCHAR2 (500);
   BEGIN
      v_oauth_key := urlencode (p_consumer_secret) || '&' || urlencode (p_token_secret);
      RETURN v_oauth_key;
   END key_token;

   MEMBER FUNCTION authorization_header (p_callback_url   IN VARCHAR2 DEFAULT NULL,
                                         p_consumer_key   IN VARCHAR2,
                                         p_timestamp      IN VARCHAR2,
                                         p_nonce          IN VARCHAR2,
                                         p_signature      IN VARCHAR2,
                                         p_token          IN VARCHAR2 DEFAULT NULL,
                                         p_verifier       IN VARCHAR2 DEFAULT NULL)
      RETURN VARCHAR2
   IS
      v_authorization_header   VARCHAR2 (4000);
   BEGIN
      IF p_token IS NULL AND p_verifier IS NULL
      THEN
         v_authorization_header :=
               'OAuth realm="",oauth_callback="'
            || p_callback_url
            || '",oauth_version="1.0",oauth_consumer_key="'
            || p_consumer_key
            || '",oauth_timestamp="'
            || p_timestamp
            || '",oauth_nonce="'
            || p_nonce
            || '",oauth_signature_method="HMAC-SHA1",oauth_signature="'
            || urlencode (p_signature)
            || '"';
      ELSE
         IF p_token IS NOT NULL AND p_verifier IS NOT NULL
         THEN
            v_authorization_header :=
                  'OAuth oauth_verifier="'
               || p_verifier
               || '",realm="",oauth_version="1.0",oauth_consumer_key="'
               || p_consumer_key
               || '",oauth_token="'
               || p_token
               || '",oauth_timestamp="'
               || p_timestamp
               || '",oauth_nonce="'
               || p_nonce
               || '",oauth_signature_method="HMAC-SHA1",oauth_signature="'
               || urlencode (p_signature)
               || '"';
         END IF;

         IF p_token IS NOT NULL AND p_verifier IS NULL
         THEN
            v_authorization_header :=
                  'OAuth realm="",oauth_version="1.0",oauth_consumer_key="'
               || p_consumer_key
               || '",oauth_token="'
               || p_token
               || '",oauth_timestamp="'
               || p_timestamp
               || '",oauth_nonce="'
               || p_nonce
               || '",oauth_signature_method="HMAC-SHA1",oauth_signature="'
               || urlencode (p_signature)
               || '"';
         END IF;
      END IF;

      RETURN v_authorization_header;
   END authorization_header;

   MEMBER FUNCTION urlencode (p_str IN VARCHAR2)
      RETURN VARCHAR2
   AS
      l_tmp    VARCHAR2 (6000);
      l_bad    VARCHAR2 (100) DEFAULT '(),>%}\];?@&<#{|^[`/:=$+''"';
      l_char   CHAR (1);
   BEGIN
      FOR i IN 1 .. NVL (LENGTH (p_str), 0)
      LOOP
         l_char := SUBSTR (p_str, i, 1);

         IF (INSTR (l_bad, l_char) > 0)
         THEN
            l_tmp := l_tmp || '%' || TO_CHAR (ASCII (l_char), 'fmXX');
         ELSE
            l_tmp := l_tmp || l_char;
         END IF;
      END LOOP;

      RETURN l_tmp;
   END urlencode;

   MEMBER FUNCTION token_extract (p_str IN VARCHAR2, p_pat IN VARCHAR2, p_delim IN VARCHAR2 := '&')
      RETURN VARCHAR2
   AS
      SUBTYPE maxvarchar2_t IS VARCHAR2 (32767);

      TYPE items_tt IS TABLE OF maxvarchar2_t
                          INDEX BY PLS_INTEGER;

      c_end_of_list   CONSTANT PLS_INTEGER := -99;
      l_item                   maxvarchar2_t;
      l_startloc               PLS_INTEGER := 1;
      items_out                items_tt;
      v_str                    VARCHAR2 (4000);

      PROCEDURE add_item (item_in IN VARCHAR2)
      IS
      BEGIN
         IF item_in = p_delim
         THEN
            /* We don't put delimiters into the collection. */
            NULL;
         ELSE
            items_out (items_out.COUNT + 1) := item_in;
         END IF;
      END;

      PROCEDURE get_next_item (string_in IN VARCHAR2, start_location_io IN OUT PLS_INTEGER, item_out OUT VARCHAR2)
      IS
         l_loc   PLS_INTEGER;
      BEGIN
         l_loc := INSTR (string_in, p_delim, start_location_io);

         IF l_loc = start_location_io
         THEN
            /* A null item (two consecutive delimiters) */
            item_out := NULL;
         ELSIF l_loc = 0
         THEN
            /* We are at the last item in the list. */
            item_out := SUBSTR (string_in, start_location_io);
         ELSE
            /* Extract the element between the two positions. */
            item_out := SUBSTR (string_in, start_location_io, l_loc - start_location_io);
         END IF;

         IF l_loc = 0
         THEN
            /* If the delimiter was not found, send back indication
               that we are at the end of the list. */

            start_location_io := c_end_of_list;
         ELSE
            /* Move the starting point for the INSTR search forward. */
            start_location_io := l_loc + 1;
         END IF;
      END get_next_item;
   BEGIN
      --v_str := REPLACE (REGEXP_SUBSTR (p_str, p_pat || '=[[:alnum:]-]+[\&|\z]'), '&', '');
      --v_str := REPLACE (v_str, p_pat || '=', '');

      --RETURN v_str;
      IF p_str IS NULL OR p_delim IS NULL
      THEN
         /* Nothing to do except pass back the empty collection. */
         NULL;
      ELSE
         LOOP
            get_next_item (p_str, l_startloc, l_item);
            add_item (l_item);
            EXIT WHEN l_startloc = c_end_of_list;
         END LOOP;
      END IF;

      FOR i IN items_out.FIRST .. items_out.LAST
      LOOP
         IF INSTR (items_out (i), p_pat || '=') > 0
         THEN
            RETURN SUBSTR (items_out (i), INSTR (items_out (i), p_pat) + LENGTH (p_pat) + 1);
         END IF;
      END LOOP;
   --  RETURN null;
   END token_extract;

   MEMBER FUNCTION VERSION
      RETURN VARCHAR2
   IS
   BEGIN
      RETURN '1.0';
   END;
END;
/
