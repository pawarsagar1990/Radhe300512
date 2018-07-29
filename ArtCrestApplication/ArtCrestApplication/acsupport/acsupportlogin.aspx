<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="acsupportlogin.aspx.cs" Inherits="ArtCrestApplication.acsupport.acsupportlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--Login Form-->
	<section class="login-sec">
		<div class="container">            
			<div class="login-box">
            <asp:Label ID="lblErrorMsg" runat="server"></asp:Label><br />
			<label for="uname"><b>Username</b></label>			
            <asp:TextBox runat="server" class="login-input" placeholder="Enter Username" ID="txtUserName" name="txtUsername" required />
 			<label for="psw"><b>Password</b></label>			
            <asp:TextBox runat="server" class="login-input" type="password" ID="txtPassword" placeholder="Enter Password" name="psw" required/>			
            <asp:Button Text="Login" class="login-btn" runat="server" ID="btnLogin" OnClick="btnLogin_Click" />            
			</div>
		</div>
		
<%--		<div class="container">
			<div class="login-box" style="text-align:center;">
				<span class="psw">Forgot <a href="#" style="color:dodgerblue">password?</a></span>
			
			<div class="reg-link" style="text-align:center;">
				<span class="psw">New to artCrest?<span>
				<a href="registration.html" style="color:dodgerblue"><span class="psw">Register</span></a>
			</div>
			</div>
			</div>--%>
	</section>

</asp:Content>
