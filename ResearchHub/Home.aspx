﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ResearchHub.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
		<title>Research Hub</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
		<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
		<script>
			// Side navigation
			function w3_open() {
				var x = document.getElementById("mySidebar");
				x.style.width = "100%";
				x.style.fontSize = "40px";
				x.style.paddingTop = "10%";
				x.style.display = "block";
			}
			function w3_close() {
				document.getElementById("mySidebar").style.display = "none";
			}
			function about_to_contact() {
				document.getElementById('about_us').style.display='none';
				document.getElementById('contact').style.display='block';
            }
		</script>
	</head>

	<body>
		<!-- Side Navigation -->
		<nav class="w3-sidebar w3-bar-block w3-card-2 w3-animate-left w3-center" style="display: none" id="mySidebar">
			<h1 class="w3-xxxlarge w3-text-theme">Research Hub</h1>
			<button onclick="document.getElementById('about_us').style.display='block'" class="w3-bar-item w3-button">About Us</button>
			<button onclick="document.getElementById('contact').style.display='block'" class="w3-bar-item w3-button">Contact</button>
			<button class="w3-bar-item w3-button w3-red" onclick="w3_close()">Close <i class="fa fa-remove"></i></button>
		</nav>

		<!-- Header -->
		<header class="w3-container w3-theme w3-padding" id="myHeader">
			<i onclick="w3_open()" class="fa fa-bars w3-xlarge w3-button w3-theme"></i>
			<div class="w3-center">
				<h3 class="w3-wide">RESEARCH HUB</h3>
				<h2 class="w3-xxxlarge w3-animate-bottom">Find all you need in one place</h2>
				<div>
                    <form id="login_signup" runat="server">
					    <div class="w3-half w3-container w3-right-align">
						    <div class="w3-padding-32">
						        <asp:button runat="server" class="w3-btn w3-xlarge w3-theme-dark w3-hover-black" onclick="sign_up" 
                                    style="font-weight: 900;" Text="&nbsp;&nbsp;&nbsp;&nbsp;Sign Up&nbsp;&nbsp;&nbsp;&nbsp;"></asp:button>
                            </div>
					    </div>
                        <div class="w3-half w3-container w3-left-align">
						    <div class="w3-padding-32">
							    <asp:button runat="server" class="w3-btn w3-xlarge w3-theme-dark w3-hover-black" onclick="login" 
                                    style="font-weight: 900;" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Login&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"></asp:button>
						    </div>
					    </div>
                    </form>
				</div>
				<br />
			</div>
		</header>

		<!-- About Section -->
		<div class="w3-container" style="padding: 128px 16px" id="about">
			<h3 class="w3-center">ABOUT THE PLATFORM</h3>
			<p class="w3-center w3-large">Servives We Offer</p>
			<div class="w3-row-padding w3-center" style="margin-top: 64px">
				<div class="w3-quarter">
					<i class="fa fa-users w3-margin-bottom w3-jumbo"></i>
					<p class="w3-large">Experienced Guides</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
				</div>
				<div class="w3-quarter">
					<i class="fa fa-book w3-margin-bottom w3-jumbo"></i>
					<p class="w3-large">Research Material</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
				</div>
				<div class="w3-quarter">
					<i class="fa fa-key w3-margin-bottom w3-jumbo w3-center"></i>
					<p class="w3-large">Privacy and Confidentiality</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
				</div>
				<div class="w3-quarter">
					<i class="fa fa-cogs w3-margin-bottom w3-jumbo"></i>
					<p class="w3-large">Support</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
				</div>
			</div>
		</div>

		<!-- Search Section -->
		<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
			<div class="w3-content">
				<div class="w3-quarter w3-center">
					<i class="material-icons w3-padding-32 w3-text-red w3-margin-right" style="font-size: 200px">search</i>
				</div>
				<div class="w3-rest">
					<form id="form_search_paper" class="w3-container w3-card-4 w3-black w3-margin">
						<h2 class="w3-center">Search</h2>
						<p>Area of Research</p>
						<input class="w3-input w3-border" name="area_research" type="text" /><br />
						<p>Author</p>
						<input class="w3-input w3-border" name="author_research" type="text" /><br />
						<div class="w3-row w3-section">
							<input type="submit" value="Find" class="w3-button w3-block w3-section w3-green w3-ripple w3-padding" />
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<!-- Contact Modal -->
		<div id="contact" class="w3-modal">
			<div class="w3-modal-content w3-animate-zoom">
				<div class="w3-container w3-blue">
					<span onclick="document.getElementById('contact').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
					<h1>Contact</h1>
				</div>
				<div class="w3-container">
					<p>Tell us what you need and we will do our best to help you</p>
					<form id="form_contact" class="w3-margin">
						<p><input class="w3-input w3-padding-16 w3-border" type="email" name="email" placeholder="Email" required="required" /></p>
						<textarea rows="5" class="w3-input w3-padding-16 w3-border" name="message" placeholder="Message" required="required"></textarea>
						<p><input type="submit" value="Send Message" class="w3-button w3-block w3-section w3-green w3-ripple w3-padding" /></p>
					</form>
				</div>
			</div>
		</div>
		
		<!-- About Us Modal -->
		<div id="about_us" class="w3-modal">
			<div class="w3-modal-content w3-animate-zoom">
				<div class="w3-container w3-blue">
					<span onclick="document.getElementById('about_us').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
					<h1>Who We Are</h1>
				</div>
				
				<div class="w3-row-padding">
					<div class="w3-half w3-margin-bottom w3-margin-top">
						<div class="w3-card-4">
							<img src="/static/images/mrinal_1.png" alt="Mrinal" style="width:100%; height:330px" />
							<div class="w3-container">
								<h3>Mrinal Jain</h3>
								<p class="w3-opacity">Core Developer</p>
								<p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
								<p><button onclick="about_to_contact()" class="w3-button w3-block w3-section w3-green w3-ripple w3-padding">Contact</button></p>
							</div>
						</div>
					</div>

					<div class="w3-half w3-margin-bottom w3-margin-top">
						<div class="w3-card-4">
							<img src="/static/images/anonymous.jpg" alt="Varun" style="width:100%; height:330px"" />
							<div class="w3-container">
								<h3>Varun Gupta</h3>
								<p class="w3-opacity">Backend Developer</p>
								<p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
								<p><button onclick="about_to_contact()" class="w3-button w3-block w3-section w3-green w3-ripple w3-padding">Contact</button></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<footer class="w3-center w3-black w3-padding-16">
			<a href="#myHeader" class="w3-button w3-red"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
			<div class="w3-xlarge w3-section">
				<i class="fa fa-github-alt w3-hover-opacity"></i>
				<i class="fa fa-linkedin w3-hover-opacity"></i>
			</div>
			<p>Created using <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-blue">w3.css</a></p>
		</footer>
	</body>
</html>
