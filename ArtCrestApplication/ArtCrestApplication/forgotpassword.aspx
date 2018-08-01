<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="ArtCrestApplication.forgotpassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--User Verification Form-->
    <div><asp:Label ID="lblErrorMsg" runat="server"></asp:Label><br /></div>
	<section class="ver-sec">
		<div class="container">
			<div class="login-box">                
				<label><b>Email ID</b></label>
                <asp:TextBox runat="server" class="login-input" placeholder="Enter EmailID" ID="txtEmailID" name="txtEmailID" required />								
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
			<input class="login-input" type="password" placeholder="Enter New Password" name="uname" required>

			<label for="psw"><b>Retype Password</b></label>
			<input class="login-input" type="password" placeholder="Retype Password" name="psw" required>
        
			<button class="login-btn" type="submit">Change Password</button>
			</div>
		</div>
	
	</section>
</asp:Content>
