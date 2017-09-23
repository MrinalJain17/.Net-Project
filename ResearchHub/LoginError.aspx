<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginError.aspx.cs" Inherits="ResearchHub.LoginError" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
		<title>Welcome to Research Hub</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" />
	</head>
	
	<body>
		<div class="w3-row-padding w3-center w3-margin-top">
			<div class="w3-third">
				<p></p>
			</div>
			<div class="w3-third">
				<div class="w3-card-2 w3-container  w3-red" style="min-height:320px">
                    <form runat="server">
                        <h2 id="title" runat="server">Login Error</h2><br />
					    <i class="fa fa-warning w3-margin-bottom w3-text-theme" style="font-size:120px"></i> <br />
                        <asp:label ID="issue" runat="server" Text=""></asp:label>
					    <asp:button runat="server" OnClick="back_to_home" class="w3-btn w3-block w3-black w3-margin-top" Text="Back to Home" />
                    </form>
				</div>
			</div>
			<div class="w3-third">
				<p></p>
			</div>
		</div>
	</body>
</html>