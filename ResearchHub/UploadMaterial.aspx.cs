using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResearchHub
{
    public partial class UploadMaterial : System.Web.UI.Page
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
        protected void go_back_home(object sender, EventArgs e)
        {
            Response.Redirect("/ResearcherHome.aspx");
        }
        protected void upload_file(object sender, EventArgs e)
        {
            String current_session_email = Session["CurrentUser_email"].ToString();
            if (FileUpload1.HasFile)
            {
                try
                {
                    if (FileUpload1.PostedFile.ContentLength < 5242880)        // Max. File size = 5 MB
                    {
                        String extension = FileUpload1.PostedFile.FileName.Substring(FileUpload1.PostedFile.FileName.LastIndexOf('.'));
                        if (extension.ToLower() == ".pdf")         // Only pdf can be uploaded
                        {
                            String filename = current_session_email + extension;
                            FileUpload1.SaveAs("E:/VIT/Fifth Semester/Projects/.Net Programming/ResearchHub/ResearchHub/static/uploaded_files/" + filename);
                            int result = MD.file_uploaded(current_session_email);
                            if (result == 1)
                            {
                                Status.Text = "File Successfully Uploaded";
                                Status.Attributes.Add("class", "w3-block w3-section w3-padding w3-text-green w3-wide w3-xlarge");
                            }
                            else
                            {
                                Status.Text = "Some Error Occured!";
                                Status.Attributes.Add("class", "w3-block w3-section w3-padding w3-text-red w3-wide w3-xlarge");
                            }
                        }
                        else
                        {
                            Status.Text = "Only files in pdf format can be uploaded";
                            Status.Attributes.Add("class", "w3-block w3-section w3-padding w3-text-red w3-wide w3-xlarge");
                        }
                    }
                    else
                    {
                        Status.Text = "The size of the file should be less than 5 MB";
                        Status.Attributes.Add("class", "w3-block w3-section w3-padding w3-text-red w3-wide w3-xlarge");
                    }
                }
                catch (Exception ex)
                {
                    Status.Text = "The file could not be uploaded. The following error occured: " + ex.Message;
                }
                Status.Visible = true;
            }
        }
        protected void researcher_sign_out(object sender, EventArgs e)
        {
            Session.Remove("CurrentUser_email");
            Session.Remove("CurrentUser_password");
            Response.Redirect("/Home.aspx");
        }
    }
}