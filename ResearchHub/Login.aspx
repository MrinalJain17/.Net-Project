<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ResearchHub.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Login</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
	    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css" />
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" />
    </head>
    <body>
		<div id="login" class="w3-margin-top">
            <div class="w3-third"><br /></div>
			<div class="w3-card-4 w3-third">
				<header class="w3-container w3-theme">
					<div class="w3-container w3-blue w3-center">
						<h2>Research Hub</h2>
					</div>
				</header>
                <div class="w3-center w3-margin-top">
                    <i class="fa fa-user" style="font-size: 200px"></i>
                </div>
				<div>
					<form id="form_login" method="post" runat="server" class="w3-container w3-light-grey w3-text-blue w3-margin">
						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 50px"><i class="w3-xxlarge fa fa-envelope-o"></i></div>
							<div class="w3-rest">
                                <asp:TextBox ID="email" runat="server" class="w3-input w3-border w3-animate-input" type="email" placeholder="Email"></asp:TextBox>
							</div>
						</div>
						<div class="w3-row w3-section">
							<div class="w3-col" style="width: 50px"><i class="w3-xxlarge fa fa-lock"></i></div>
							<div class="w3-rest">
                                <asp:TextBox ID="password" runat="server" class="w3-input w3-border w3-animate-input" type="password" placeholder="Password"></asp:TextBox>
							</div>
						</div>
                        <div class="w3-row w3-section">
                            <div class="w3-half">
                                <asp:RadioButton ID="researcher" runat="server" GroupName="user_type" class="w3-radio" Text="Research Scholar" Font-Size="Large" Checked="true"/>
                            </div>

                            <div class="w3-half">
                                <asp:RadioButton ID="guide" runat="server" GroupName="user_type" class="w3-radio" Text="Guide" Font-Size="Large" />
                            </div>
                        </div>
						<div class="w3-row w3-section">
                            <asp:Button ID="submit" runat="server" OnClick="login" class="w3-button w3-block w3-section w3-green w3-ripple w3-padding" Text="Login" />
						</div>
					</form>
				</div>
				<br />
			</div>
            <div class="w3-third"><br /></div>
		</div>
    </body>
</html>
