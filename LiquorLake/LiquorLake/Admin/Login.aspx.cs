using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Users UserManager = new Users();
        
        int saltSize = 5;
        string salt = UserManager.CreateSalt(saltSize);
        string passwordHash = UserManager.CreatePasswordHash("PsiStorm1", salt);

        UserManager.StoreAccountDetails("raybains", passwordHash);

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {

    }
}