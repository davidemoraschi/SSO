-- ****** Object: Package SSO.ERROR_HANDLER Script Date: 2/14/2012 7:54:00 AM ******
CREATE PACKAGE error_handler
IS
   PROCEDURE aspx (p_error_code      IN VARCHAR2 DEFAULT NULL,
                   p_error_message   IN VARCHAR2 DEFAULT NULL,
                   p_stack_trace     IN VARCHAR2 DEFAULT NULL);

   PROCEDURE test;
END;
/
