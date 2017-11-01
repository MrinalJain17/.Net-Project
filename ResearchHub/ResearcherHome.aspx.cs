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
            Boolean flag = true;
            String current_session_email = Session["CurrentUser_email"].ToString();
            if (current_session_email != "")
            {
                if (MD.login(current_session_email, Session["CurrentUser_password"].ToString()) == 1)
                {
                    String name = MD.get_name(current_session_email);
                    CurrentUser.InnerHtml = name;
                    int image = MD.check_image(current_session_email);
                    if (image == 1)
                        CurrentUserImage.Src = "/static/images/researcher/" + current_session_email + ".png";
                    else
                        CurrentUserImage.Src = "/static/images/no_image_user.png";
                }
                else
                {
                    Session["Issue"] = "Incorrect Password";
                    flag = false;
                }
                    
            }
            else
            {
                Session["Issue"] = "User Not Found";
                flag = false;
            }
            if (!flag)
            {
                Session.Remove("CurrentUser_email");
                Session.Remove("CurrentUser_password");
                Response.Redirect("/LoginError.aspx");
            }
        }
        protected void researcher_sign_out(object sender, EventArgs e)
        {
            Session.Remove("CurrentUser_email");
            Session.Remove("CurrentUser_password");
            Response.Redirect("/Home.aspx");
        }
        protected void choose_guide(object sender, EventArgs e)
        {
            Response.Redirect("/ChooseGuide.aspx");
        }
        protected void upload_material(object sender, EventArgs e)
        {
            Response.Redirect("/UploadMaterial.aspx");
        }
        protected void temp(object sender, EventArgs e)
        {

        }
    }
}