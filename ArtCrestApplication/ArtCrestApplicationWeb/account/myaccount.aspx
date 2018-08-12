<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="myaccount.aspx.cs" Inherits="ArtCrestApplicationWeb.account.myaccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/css/account.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField runat="server" ID="hdnUserID" ClientIDMode="Static" />
    <section class="account-sec">
        <div class="container">
            <div class="myaccount-header">
                <div class="myaccount-header-link active">
                    <a href="myaccount.aspx">My Profile</a>
                </div>
                <div class="myaccount-header-link">
                    <a href="manageaddresses.aspx">My Addresses</a>
                </div>
                <div class="myaccount-header-link">
                    <a href="/order/orderhistory.aspx">My Orders</a>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="personal-info">
                <div class="personal-info-head">
                    <div class="personal-info-title">
                        My Profile Information
                    </div>
                    <div class="personal-info-edit">
                        <button onclick="enableProfileUpdate()" id="editButton">EDIT</button>
                    </div>
                </div>

                <div class="personal-info-id">
                    Name
                </div>
                <div class="personal-info-nm">
                    <input type="text" required placeholder="First Name" class="input-nm" disabled>
                    <input type="text" required placeholder="Last Name" class="input-nm" disabled>
                </div>

                <div class="personal-info-id">
                    Gender
                </div>
                <div class="personal-info-nm">
                    <div class="radio">
                        <label><input type="radio" name="optradio" checked disabled>&nbsp;Male</label>
                    </div>
                    <div class="radio">
                        <label><input type="radio" name="optradio" disabled>&nbsp;Female</label>
                    </div>
                </div>
                
                <div class="personal-info-id">
                    Email ID
                </div>
                <div class="personal-info-nm">
                    <input type="text" required placeholder="Email ID" class="input-nm" disabled>
                </div>

                <div class="personal-info-id">
                    Mobile Number
                </div>
                <div class="personal-info-nm">
                    <input type="text" required placeholder="Mobile Number" class="input-nm" disabled>
                </div>

                <div class="personal-info-passwd">
                    Change Password
                </div>
                <div class="personal-info-nm">
                    <input type="text" required placeholder="Type Current Password" class="input-passwd" disabled>
                    <input type="text" required placeholder="Enter new Password" class="input-passwd" disabled>
                    <input type="text" required placeholder="Re-enter new Password" class="input-passwd" disabled>
                </div>

                <div class="save-button" id="saveButton">
                    <a href="#" class="btn btn-primary prod-slid-btn" role="button">
                        SAVE
                    </a>
                </div>

            </div>
        </div>

    </section>

    <script>
        $("button").click(function () {
            $("input").removeAttr("disabled");
        });
        function enableProfileUpdate() {
            document.getElementById('editButton').style.display = "none";
            document.getElementById('saveButton').style.display = "block";
        }
    </script>

</asp:Content>
