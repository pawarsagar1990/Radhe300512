<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="acsupportmenu.aspx.cs" Inherits="ArtCrestApplication.acsupport.acsupportmenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="login-sec">
		<div class="container">
			<table>
                <tr><th>Product Management</th></tr>
                <tr><td><a href="ProductEntry.aspx"><b>Create New Product</b></a></td></tr>
                <tr><td><a href="ProductEdit.aspx"><b>Edit Product</b></a></td></tr>
			</table>
		</div>		
	</section>
</asp:Content>
