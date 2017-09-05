using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResearchHub
{
    public partial class ResearcherHome : System.Web.UI.Page
    {
        MiddleWare MD = new MiddleWare();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser_email"].ToString() != "")
            {
                if (MD.login(Session["CurrentUser_email"].ToString(), Session["CurrentUser_password"].ToString()) == 1)
                {
                    String name = MD.get_name(Session["CurrentUser_email"].ToString());
                    CurrentUser.InnerHtml = name;
                }
                else
                    Response.Redirect("/LoginError.aspx");
            }
            else
                Response.Redirect("/LoginError.aspx");
        }
        protected void researcher_sign_out(object sender, EventArgs e)
        {
            Session.Remove("CurrentUser_email");
            Session.Remove("CurrentUser_password");
            Response.Redirect("/Home.aspx");
        }
    }
}