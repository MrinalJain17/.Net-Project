using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResearchHub
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void login(object sender, EventArgs e)
        {
            Session["CurrentUser_email"] = email.Text;
            Session["CurrentUser_password"] = password.Text;
            if (researcher.Checked == true)
                Response.Redirect("/ResearcherHome.aspx");
            else
                Response.Redirect("/GuideHome.aspx");
        }
    }
}