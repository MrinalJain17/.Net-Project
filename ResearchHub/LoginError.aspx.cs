using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResearchHub
{
    public partial class LoginError : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            issue.Text = Session["Issue"].ToString();
            if (Session["Issue"].ToString().Equals("Incorrect Password") || Session["Issue"].ToString().Equals("User Not Found"))
                title.InnerText = "Login Error";
            else
                title.InnerText = "Sign Up Error";
        }
        protected void back_to_home(object sender, EventArgs e)
        {
            Session.Remove("Issue");
            Response.Redirect("/Home.aspx");
        }
    }
}