<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="ArtCrestApplication.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	<!--Registration Form-->
	<section class="reg-sec">
		<div class="container">
			<div class="reg-box">
            <asp:Label ID="lblErrorMsg" runat="server"></asp:Label><br />
			<label for="uname"><b>First Name</b></label>			
            <asp:TextBox runat="server" class="login-input" placeholder="Enter First Name" ID="txtFirstName" name="txtFirstName" required />

			<label for="uname"><b>Last Name</b></label>			
			<asp:TextBox runat="server" class="login-input" placeholder="Enter Last Name" ID="txtLastName" name="txtLastName" required />

			<label for="uname"><b>Email ID</b></label>
			<asp:TextBox runat="server" class="login-input" TextMode="Email" placeholder="Enter Email ID" ID="txtEmailAddress" name="txtEmailAddress" required />
			
			<label for="uname"><b>Mobile No.</b>&nbsp;&nbsp;&nbsp;(Please enter your 10 digit mobile number)</label>			
            <asp:TextBox runat="server" class="login-input" TextMode="Number" placeholder="Enter 10 digit mobile number" ID="txtMobileNo" name="txtMobileNo" required />
			
			<label for="psw"><b>Password</b></label>
			<asp:TextBox runat="server" class="login-input" TextMode="Password" placeholder="Enter Password" ID="txtPassword" name="txtPassword" required />
			
			<label for="psw"><b>Confirm Password</b></label>
			<asp:TextBox runat="server" class="login-input" TextMode="Password" placeholder="Enter Password" ID="txtConfirmPassword" name="txtConfirmPassword" required />
        			
            <asp:Button Text="Register" class="login-btn" runat="server" ID="btnRegister" OnClick="btnRegister_Click" />
			<p style="text-align:center;">By creating an account you agree to our <a target="_blank" href="/termsprivacy.aspx" style="color:dodgerblue">Terms & Privacy</a>.</p>
			</div>
		</div>
		
		<div class="container">
			<div class="reg-box" style="text-align:center;">
				<span class="psw">Already have account?</span>
				<span class="psw">Click <a href="/login.aspx" style="color:dodgerblue">Here</a> to Login</span>
			</div>
		</div>
	</section>
</asp:Content>
