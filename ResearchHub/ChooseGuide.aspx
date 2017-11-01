<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChooseGuide.aspx.cs" Inherits="ResearchHub.ChooseGuide" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
		<title>Welcome to Research Hub</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" />
		<style>
			body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
		</style>
	</head>
	
	<body>
        <form runat="server">
            <!-- Sidebar -->
		    <nav class="w3-sidebar w3-collapse w3-black w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br />
			    <div class="w3-container">
				    <img runat="server" id="CurrentUserImage" src="#" style="width:45%; height:120px" class="w3-round" /><br /><br />
				    <h4><a id="CurrentUser" runat="server"><b>User</b></a></h4>
				    <p class="w3-text-grey">Researcher</p>
			    </div>
			    <div class="w3-bar-block">
				    <a href="#" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>RESEARCH</a> 
				    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>ABOUT</a> 
				    <div class="w3-bottom w3-hide-small">
					    <asp:LinkButton runat="server" onclick="researcher_sign_out" class="w3-text-red w3-button">
                            <span class="w3-xlarge w3-margin-right">Sign Out</span><i class="fa fa-sign-out w3-xlarge"></i>
					    </asp:LinkButton>
                    </div>
			    </div>
		    </nav>

            <!-- !PAGE CONTENT! -->
            <div class="w3-main" style="margin-left:300px">

                <!-- Header -->
                <header id="portfolio">
                    <div class="w3-container">
                        <h1><b>My Research Portal</b></h1>
                    </div>
                </header>

                <div runat="server" id="guides"></div>

                <div class="w3-container w3-card-4 w3-center">
                    <div class="w3-row w3-section">
                        <asp:TextBox ID="email" runat="server" class="w3-input w3-border w3-animate-input" 
                            type="email" placeholder="Enter the Email of the Guide"></asp:TextBox>
					</div>
                    <div class="w3-row w3-section">
                        <asp:Button ID="select" runat="server" OnClick="select_guide" class="w3-button w3-block w3-section w3-green w3-ripple w3-padding" Text="Update" />
                        <asp:Button ID="go_back" runat="server" OnClick="go_back_home" class="w3-button w3-block w3-section w3-red w3-ripple w3-padding" Text="Go Back" />
					</div>
                </div>

            </div>
        </form>
	</body>
</html>
