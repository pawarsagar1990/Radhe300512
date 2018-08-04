<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="ArtCrestApplication.forgotpassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--User Verification Form--> 
    <br /> 
    <div class="container"><asp:Label ID="lblErrorMsg" runat="server"></asp:Label></div>  
	<section class="ver-sec" runat="server" id="sendLinkDiv">
		<div class="container">            
			<div class="login-box">                
				<label><b>Email ID</b></label>
                <asp:TextBox runat="server" class="login-input" TextMode="Email" placeholder="Enter EmailID" ID="txtEmailID" name="txtEmailID" required />								
                <asp:Button Text="Send Verfication Link" class="ver-link-btn" runat="server" ID="btnSendVerificationLink" OnClick="btnSendVerificationLink_Click" />
			</div>
		</div>
	</section>
	
	<section class="chg-pwd-sec" runat="server" id="changePasswordDiv">
		<div class="container">
			<div class="chg-pwd-title">
				<span>Change Password</span>
			</div>
			<div class="login-box">
			<label for="uname"><b>New Password</b></label>
            <asp:TextBox runat="server" class="login-input" TextMode="Password" placeholder="Enter New Password" ID="txtPassword1" name="txtPassword1" required />								
			
			<label for="psw"><b>Retype Password</b></label>			
            <asp:TextBox runat="server" class="login-input" TextMode="Password" placeholder="Retype Password" ID="txtPassword2" name="txtPassword2" required />								
                			
            <asp:Button Text="Change Password" class="ver-link-btn" runat="server" ID="btnChangePassword" OnClick="btnChangePassword_Click" />
			</div>
		</div>
	
	</section>
</asp:Content>
