using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Security.Principal;

/// <summary>
/// Summary description for Global
/// </summary>
public class Global : System.Web.HttpApplication
{
    public Global()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    protected void Application_AuthenticateRequest(object sender, EventArgs e)
    {
        string cookieName = FormsAuthentication.FormsCookieName;
        HttpCookie authCookie = Context.Request.Cookies[cookieName];

        if (null == authCookie)
        {
            return;
        }

        FormsAuthenticationTicket authTicket = null;

        try
        {
            authTicket = FormsAuthentication.Decrypt(authCookie.Value);
        }
        catch (Exception ex)
        {
            return;
        }

        if (null == authTicket)
        {
            // Cookie failed to decrypt.
            return;
        }

        string[] roles = authTicket.UserData.Split('|');

        // Create an Identity object
        FormsIdentity id = new FormsIdentity(authTicket);

        // This principal will flow throughout the request.
        CustomPrincipal principal = new CustomPrincipal(id, roles);
        // Attach the new principal object to the current HttpContext object
        Context.User = principal;
    }
}