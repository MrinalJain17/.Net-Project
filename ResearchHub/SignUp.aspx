<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ResearchHub.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Sign Up</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
	    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css" />
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" />
    </head>
    <body>
        <div class="w3-col l3"><br /></div>
		<div id="sign_up" class="w3-margin-top w3-col l6">
			<div class="w3-card-4">
				<header class="w3-container w3-theme">
					<div class="w3-container w3-blue w3-center">
						<h2>Research Hub</h2>
					</div>
				</header>
				<div>
					<form id="form_sign_up" runat="server" method="post" class="w3-container w3-light-grey w3-text-blue w3-margin">
						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 50px"><i class="w3-xxlarge fa fa-user"></i></div>
							<div class="w3-rest">
                                <asp:TextBox ID="name" runat="server" class="w3-input w3-border w3-animate-input" 
                                    type="text" placeholder="Name"></asp:TextBox>
							</div>
						</div>
						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 50px"><i class="w3-xxlarge fa fa-envelope-o"></i></div>
							<div class="w3-rest">
                                <asp:TextBox ID="email" runat="server" class="w3-input w3-border w3-animate-input" 
                                    type="email" placeholder="Email"></asp:TextBox>
							</div>
						</div>
						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 50px"><i class="w3-xxlarge fa fa-phone"></i></div>
							<div class="w3-rest">
                                <asp:TextBox ID="phone" runat="server" class="w3-input w3-border w3-animate-input" 
                                    type="text" placeholder="Phone"></asp:TextBox>
							</div>
						</div>
						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 50px"><i class="w3-xxlarge fa fa-lock"></i></div>
							<div class="w3-rest">
                                <asp:TextBox ID="password" runat="server" class="w3-input w3-border w3-animate-input" 
                                    type="password" placeholder="Password"></asp:TextBox>
							</div>
						</div>
						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 50px"><i class="w3-xxlarge fa fa-lock"></i></div>
							<div class="w3-rest">
                                <asp:TextBox ID="conf_password" runat="server" class="w3-input w3-border w3-animate-input" 
                                    type="password" placeholder="Confirm Password"></asp:TextBox>
							</div>
						</div>
						<div class="w3-row w3-section">
							<div class="w3-half">
                                <asp:RadioButton ID="researcher" runat="server" GroupName="user_type" 
                                    class="w3-radio" Text="Research Scholar" Font-Size="Large" Checked="true"/>
                            </div>

                            <div class="w3-half">
                                <asp:RadioButton ID="guide" runat="server" GroupName="user_type" 
                                    class="w3-radio" Text="Guide" Font-Size="Large" />
                            </div>
						</div>
						<div class="w3-row w3-section">
                            <asp:Button ID="submit" runat="server" OnClick="sign_up" class="w3-button w3-block w3-section w3-green w3-ripple w3-padding" Text="Sign Up" />
                            <asp:Button ID="go_to_login" runat="server" OnClick="to_login" 
                                class="w3-button w3-block w3-section w3-red w3-ripple w3-padding" Text="Already have an account? Login" />
						</div>
                        <h4 runat="server" id="details_error" class="w3-text-red w3-block" style="margin:auto"></h4>
                        <div class="w3-row w3-section">
                            <asp:Button ID="go_to_home" runat="server" OnClick="to_home" 
                                class="w3-button w3-block w3-section w3-black w3-ripple w3-padding" style="width:200px; margin:auto" Text="Back to Home" />
                        </div>
					</form>
				</div>
				<br />
			</div>
		</div>
        <div class="w3-col l3"><br /></div>
    </body>
</html>
