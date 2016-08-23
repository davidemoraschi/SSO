-- ****** Object: Package Body SSO.SIGNON Script Date: 2/14/2012 7:53:51 AM ******
CREATE PACKAGE BODY signon
IS
   PROCEDURE jsp (originalurl IN VARCHAR2)
   IS
      v_originalurl   VARCHAR2 (32000) := originalurl;
   BEGIN
      HTP.htmlOpen;
      HTP.headOpen;
      HTP.title ('Sign on');
      HTP.p ('<link href="/i/css/sso_msft.css" rel="stylesheet" type="text/css">');
      HTP.headClose;
      HTP.bodyOpen;
      HTP.p (
            '
                <div id="header">
                    <h1>EuroStrategy Sign on</h1>
                </div>
                <div id="server_version">
                    <p>'
         || v_originalurl
         || '</p>
                </div>
                <img src="/i/apex/builder/menu-administration-128.png" border="0" alt="" />
                <div id="content">
                    <div class="content-container">
                        <fieldset>
                            <legend>Please select one of the social networks available to log in.</legend>
                            <h2></h2>
                            <div id="details-left">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr class="alt">
                                        <th>Google </th>
                                        <td><img src="/i/32px/google.png" /> </td>
                                    </tr>
                                    <tr>
                                        <th>Dropbox </th>
                                        <td><img src="/i/32px/dropbox.png" /></td>
                                    </tr>
                                    <tr class="alt">
                                        <th>MSN </th>
                                        <td><img src="/i/32px/msn.png" /> </td>
                                    </tr>
                                    <tr>
                                        <th><a href="/sso/authenticate_lnkd.jsp?originalurl='
         || util.urlencode (v_originalurl)
         || '">LinkedIn</a></th>
                                        <td><img src="/i/32px/linkedin.png" /> </td>
                                    </tr>
                                    <tr class="alt">
                                        <th>Yahoo </th>
                                        <td><img src="/i/32px/yahoo.png" /> </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="details-right">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr class="alt">
                                        <th>Google </th>
                                        <td><img src="/i/32px/google.png" /> </td>
                                    </tr>
                                    <tr>
                                        <th>Dropbox </th>
                                        <td><img src="/i/32px/dropbox.png" /></td>
                                    </tr>
                                    <tr class="alt">
                                        <th>MSN </th>
                                        <td><img src="/i/32px/msn.png" /> </td>
                                    </tr>
                                    <tr>
                                        <th>LinkedIn </th>
                                        <td><img src="/i/32px/linkedin.png" /> </td>
                                    </tr>
                                    <tr class="alt">
                                        <th>Yahoo </th>
                                        <td><img src="/i/32px/yahoo.png" /> </td>
                                    </tr>
                                </table>
                                <div class="clear">
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
      ');
      HTP.bodyClose;
      HTP.htmlClose;
   END;

   PROCEDURE xml (token IN VARCHAR2)
   IS
   BEGIN
      OWA_UTIL.mime_header ('text/xml', TRUE, 'utf-8');
      HTP.p ('<return_code><pass userid="demo" username="demo user" /></return_code>');
   END;
END;
/
