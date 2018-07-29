<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ArtCrestApplication.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Login Form-->
	<section class="login-sec">
		<div class="container">
			<div class="login-box">
            <asp:Label ID="lblErrorMsg" runat="server"></asp:Label><br />
			<label for="uname"><b>EmailID</b></label>			
            <asp:TextBox runat="server" class="login-input" placeholder="Enter EmailID" ID="txtEmailID" name="txtEmailID" required />
			<label for="psw"><b>Password</b></label>			
            <asp:TextBox runat="server" class="login-input" TextMode="Password" placeholder="Enter Password" ID="txtPassword" name="txtPassword" required />			
            <asp:Button Text="Login" class="login-btn" runat="server" ID="btnLogin" OnClick="btnLogin_Click" />
			</div>
		</div>
		
		<div class="container">
			<div class="login-box" style="text-align:center;">
				<span class="psw">Forgot <a href="/forgot.aspx" style="color:dodgerblue">password?</a></span>
			
			<div class="reg-link" style="text-align:center;">
				<span class="psw">New to artCrest?<span>
				<a href="/register.aspx" style="color:dodgerblue"><span class="psw">Register</span></a>
			</div>
			</div>
			</div>
	</section>
</asp:Content>
