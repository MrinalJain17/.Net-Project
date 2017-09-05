using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResearchHub
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void researcher_login(object sender, EventArgs e)
        {
            Session["CurrentUser_email"] = researcher_email.Text;
            Session["CurrentUser_password"] = researcher_password.Text;
            Response.Redirect("/ResearcherHome.aspx");
        }
    }
}