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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"].ToString() != "")
               CurrentUser.InnerHtml = Session["CurrentUser"].ToString();
            else
                Response.Redirect("/LoginError.aspx");
        }
        protected void researcher_sign_out(object sender, EventArgs e)
        {
            Session.Remove("CurrentUser");
            Response.Redirect("/Home.aspx");
        }
    }
}