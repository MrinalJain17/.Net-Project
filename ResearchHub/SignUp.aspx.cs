using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResearchHub
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void to_login(object sender, EventArgs e)
        {
            Response.Redirect("/Login.aspx");
        }
        protected void to_home(object sender, EventArgs e)
        {
            Response.Redirect("/Home.aspx");
        }
        protected void sign_up(object sender, EventArgs e)
        {
            String _email = email.Text;
            String _name = name.Text;
            String _phone = phone.Text;
            String _pass = password.Text;
            String _conf_pass = conf_password.Text;
            if (_email != "" && _name != "" && _pass != "" && _phone != "")
            {
                if (_pass.Equals(_conf_pass))
                {
                    MiddleWare MD = new MiddleWare();
                    int result;
                    if (researcher.Checked == true)
                        result = MD.sign_up(_name, _email, _pass, _phone);
                    else
                        result = MD.sign_up(_name, _email, _pass, _phone, false);

                    if (result == 1)
                        Response.Redirect("/Login.aspx");
                    else
                    {
                        Session["Issue"] = "This email is already registered !";
                        Response.Redirect("/LoginError.aspx");
                    }
                }
                else
                {
                    details_error.InnerText = "Passwords do not match !";
                }
            }
            else
                details_error.InnerText = "Invalid details entered !";
        }
    }
}