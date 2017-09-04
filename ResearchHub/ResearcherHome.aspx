<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResearcherHome.aspx.cs" Inherits="ResearchHub.ResearcherHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
		<title>Welcome to Research Hub</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
		<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
	</head>
	
	<body>
		<!-- Navbar (sit on top) -->
		<div class="w3-top">
			<div class="w3-bar w3-white w3-wide w3-padding w3-card-4">
				<a id="CurrentUser" runat="server" href="#" class="w3-bar-item w3-button">Current User</a>
				<!-- Float links to the right. Hide them on small screens -->
				<div class="w3-right w3-hide-small">
                    <form runat="server">
                        <asp:LinkButton runat="server" onclick="researcher_sign_out" class="w3-bar-item w3-button"><i class="fa fa-sign-out w3-xlarge"></i></asp:LinkButton>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>