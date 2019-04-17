using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminDefault : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        WelcomeLabel.Text = "WELCOME ADMIN, " + Context.User.Identity.Name;
    }

    protected void LogOutButton_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();

        //clear and abandon session
        Session.Clear();
        Session.Abandon();

        Response.Redirect("~/Admin/Login.aspx");
    }
}