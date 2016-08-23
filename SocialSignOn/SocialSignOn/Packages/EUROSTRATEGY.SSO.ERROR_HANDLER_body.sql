-- ****** Object: Package Body SSO.ERROR_HANDLER Script Date: 2/14/2012 7:54:00 AM ******
CREATE PACKAGE BODY error_handler
IS
   PROCEDURE aspx (p_error_code      IN VARCHAR2 DEFAULT NULL,
                   p_error_message   IN VARCHAR2 DEFAULT NULL,
                   p_stack_trace     IN VARCHAR2 DEFAULT NULL)
   IS
   BEGIN
      HTP.p (
         '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
        <html xmlns="http://www.w3.org/1999/xhtml"> 
        <head> 
        <title>IIS 7.0 Detailed Error - 404.0 - Not Found</title> 
        <style type="text/css"> 
        <!-- 
        body{margin:0;font-size:.7em;font-family:Verdana,Arial,Helvetica,sans-serif;background:#CBE1EF;} 
        code{margin:0;color:#006600;font-size:1.1em;font-weight:bold;} 
        .config_source code{font-size:.8em;color:#000000;} 
        pre{margin:0;font-size:1.4em;word-wrap:break-word;} 
        ul,ol{margin:10px 0 10px 40px;} 
        ul.first,ol.first{margin-top:5px;} 
        fieldset{padding:0 15px 10px 15px;} 
        .summary-container fieldset{padding-bottom:5px;margin-top:4px;} 
        legend.no-expand-all{padding:2px 15px 4px 10px;margin:0 0 0 -12px;} 
        legend{color:#333333;padding:4px 15px 4px 10px;margin:4px 0 8px -12px;_margin-top:0px; 
         border-top:1px solid #EDEDED;border-left:1px solid #EDEDED;border-right:1px solid #969696; 
         border-bottom:1px solid #969696;background:#E7ECF0;font-weight:bold;font-size:1em;} 
        a:link,a:visited{color:#007EFF;font-weight:bold;} 
        a:hover{text-decoration:none;} 
        h1{font-size:2.4em;margin:0;color:#FFF;} 
        h2{font-size:1.7em;margin:0;color:#CC0000;} 
        h3{font-size:1.4em;margin:10px 0 0 0;color:#CC0000;} 
        h4{font-size:1.2em;margin:10px 0 5px 0; 
        }#header{width:96%;margin:0 0 0 0;padding:6px 2% 6px 2%;font-family:"trebuchet MS",Verdana,sans-serif; 
         color:#FFF;background-color:#5C87B2; 
        }#content{margin:0 0 0 2%;position:relative;} 
        .summary-container,.content-container{background:#FFF;width:96%;margin-top:8px;padding:10px;position:relative;} 
        .config_source{background:#fff5c4;} 
        .content-container p{margin:0 0 10px 0; 
        }#details-left{width:35%;float:left;margin-right:2%; 
        }#details-right{width:63%;float:left; 
        }#server_version{width:96%;_height:1px;min-height:1px;margin:0 0 5px 0;padding:11px 2% 8px 2%;color:#FFFFFF; 
         background-color:#5A7FA5;border-bottom:1px solid #C1CFDD;border-top:1px solid #4A6C8E;font-weight:normal; 
         font-size:1em;color:#FFF;text-align:right; 
        }#server_version p{margin:5px 0;} 
        table{margin:4px 0 4px 0;width:100%;border:none;} 
        td,th{vertical-align:top;padding:3px 0;text-align:left;font-weight:bold;border:none;} 
        th{width:30%;text-align:right;padding-right:2%;font-weight:normal;} 
        thead th{background-color:#ebebeb;width:25%; 
        }#details-right th{width:20%;} 
        table tr.alt td,table tr.alt th{background-color:#ebebeb;} 
        .highlight-code{color:#CC0000;font-weight:bold;font-style:italic;} 
        .clear{clear:both;} 
        .preferred{padding:0 5px 2px 5px;font-weight:normal;background:#006633;color:#FFF;font-size:.8em;} 
        --> 
        </style> 
         
        </head> 
        <body> 
        <div id="header"><h1>Server Error in Application "EuroStrategy.net"</h1></div> 
        <div id="server_version"><p>Internet Information Services 7.0</p></div> 
        <div id="content"> 
        <div class="content-container"> 
         <fieldset><legend>Error Summary</legend> 
          <h2>'
         || p_error_message
         || '</h2> 
          <h3>The resource you are looking for has been removed, had its name changed, or is temporarily unavailable.</h3> 
         </fieldset> 

        </div> 
        <div class="content-container"> 
         <fieldset><legend>Detailed Error Information</legend> 
          <div id="details-left"> 
           <table border="0" cellpadding="0" cellspacing="0"> 
            <tr class="alt"><th>Module</th><td>IIS Web Core</td></tr> 
            <tr><th>Notification</th><td>MapRequestHandler</td></tr> 
            <tr class="alt"><th>Handler</th><td>StaticFile</td></tr> 
            <tr><th>Error Code</th><td>'
         || p_error_code
         || '</td></tr> 
             
           </table> 
          </div> 
          <div id="details-right"> 
           <table border="0" cellpadding="0" cellspacing="0"> 
            <tr class="alt"><th>Requested URL</th><td>http://'
         || OWA_UTIL.get_cgi_env ('SERVER_NAME')
         || ':'
         || OWA_UTIL.get_cgi_env ('SERVER_PORT')
         || '</td></tr> 
            <tr><th>Physical Path</th><td>'
         || OWA_UTIL.get_cgi_env ('PATH_INFO')
         || '</td></tr> 
            <tr class="alt"><th>Logon Method</th><td>Anonymous</td></tr> 
            <tr><th>Detailed trace</th><td>'
         || p_stack_trace
         || '</td></tr> 
             
           </table> 
           <div class="clear"></div> 
          </div> 
         </fieldset> 

        </div> 
        <div class="content-container"> 
         <fieldset><legend>Most likely causes:</legend> 
          <ul>     <li>The directory or file specified does not exist on the Web server.</li>     <li>The URL contains a typographical error.</li>     <li>A custom filter or module, such as URLScan, restricts access to the file.</li> </ul> 
         </fieldset> 
        </div> 
        <div class="content-container"> 
         <fieldset><legend>Things you can try:</legend> 
          <ul>     <li>Create the content on the Web server.</li>     <li>Review the browser URL.</li>     <li>Create a tracing rule to track failed requests for this HTTP status code and see which module is calling SetStatus. For more information about creating a tracing rule for failed requests, click <a href="http://go.microsoft.com/fwlink/?LinkID=66439">here</a>. </li> </ul> 
         </fieldset> 

        </div> 
         
         
        <div class="content-container"> 
         <fieldset><legend>Links and More Information</legend> 
          This error means that the file or directory does not exist on the server. Create the file or directory and try the request again. 
          <p><a href="http://go.microsoft.com/fwlink/?LinkID=62293&amp;IIS70Error=404,0,0x80070002,6002">View more information &raquo;</a></p> 
           
         </fieldset> 
        </div> 
        </div> 
        </body> 
        </html> 
');
   END;

   PROCEDURE test
   IS
   BEGIN
      RAISE_APPLICATION_ERROR (-20000, 'Force and exception');
   EXCEPTION
      WHEN OTHERS
      THEN
         SSO.error_handler.aspx (SQLCODE,
                                 SQLERRM,
                                 DBMS_UTILITY.format_error_backtrace); 
   END;
END;
/
