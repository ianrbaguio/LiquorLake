using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Security.Principal;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Users UserManager = new Users();

        //int saltSize = 5;
        //string salt = UserManager.CreateSalt(saltSize);
        //string passwordHash = UserManager.CreatePasswordHash("PsiStorm1", salt);

        //UserManager.StoreAccountDetails("raybains", passwordHash, salt);

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        Users UsersManager = new Users();

        bool isAuthenticated = UsersManager.VerifyPassword(UsernameTB.Text, PasswordTB.Text);

        if (isAuthenticated)
        {
            string roles = UsersManager.GetRoles();

            FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(1, 
                                                                            UsernameTB.Text, 
                                                                            DateTime.Now, 
                                                                            DateTime.Now.AddMinutes(60), 
                                                                            false, 
                                                                            roles);

            string encryptedTicket = FormsAuthentication.Encrypt(authTicket);

            HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);

            Response.Cookies.Add(authCookie);

            Response.Redirect(FormsAuthentication.GetRedirectUrl(UsernameTB.Text, false));
        }
    }
}