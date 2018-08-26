<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="myaccount.aspx.cs" Inherits="ArtCrestApplicationWeb.account.myaccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/css/account.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField runat="server" ID="hdnUserID" ClientIDMode="Static" />
    <section class="account-sec">
        
        <div class="container">
            <div style="margin-top:20px;margin-bottom:20px;padding:10px;">
                <asp:Label ID="lblErrorMsg" runat="server"></asp:Label><br />
            </div>
            <div class="myaccount-header">
                <div class="myaccount-header-link active">
                    <a href="myaccount.aspx">My Profile</a>
                </div>
                <!--<div class="myaccount-header-link">
                    <a href="manageaddresses.aspx">My Addresses</a>
                </div>-->
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
                        <span id="editButton" style="cursor:pointer;">EDIT</span>
                    </div>
                </div>

                <div class="personal-info-id">
                    Name
                </div>
                <div class="personal-info-nm">
                    <input type="text" required runat="server" placeholder="First Name" id="uFirstName" class="input-nm enableEdit" ClientIDMode="static" disabled>
                    <input type="text" required runat="server" placeholder="Last Name" id="uLastName" class="input-nm enableEdit" ClientIDMode="static" disabled>
                </div>

                <div class="personal-info-id">
                    Gender
                </div>
                <div class="personal-info-nm">
                    <div class="radio">
                        <label><input type="radio" runat="server" name="optradio" ClientIDMode="static"  id="genderMale" class="enableEdit">&nbsp;Male</label>
                    </div>
                    <div class="radio">
                        <label><input type="radio" runat="server" name="optradio" ClientIDMode="static"  id="genderFemale" class="enableEdit">&nbsp;Female</label>
                    </div>
                    <div class="radio">
                        <label><input type="radio" runat="server" name="optradio" ClientIDMode="static"  id="genderNotSpecified" class="enableEdit">&nbsp;Not Specified</label>
                    </div>
                </div>
                
                <div class="personal-info-id">
                    Email ID
                </div>
                <div class="personal-info-nm">
                    <input type="email" required placeholder="Email ID" runat="server" ClientIDMode="static" class="input-nm enableEdit" disabled id="uEmailID">
                </div>

                <div class="personal-info-id">
                    Mobile Number
                </div>
                <div class="personal-info-nm">
                    <input type="number" required placeholder="Mobile Number" runat="server" ClientIDMode="static" class="input-nm enableEdit" disabled id="uMobileNo">
                </div>

                <div class="save-button" id="saveButton">
                    <!--<button class="btn btn-primary prod-slid-btn" role="button" OnClick="btnProfileSave">
                        SAVE
                    </button>-->
                    <asp:Button Text="SAVE" class="btn btn-primary prod-slid-btn" runat="server" ID="btnSave" OnClick="btnProfileSave" />
                    <button class="btn btn-primary prod-slid-btn disableProfileEdit" role="button">
                        CANCEL
                    </button>
                </div>

                <div class="personal-info-passwd">
                    <span class="passwdChange" style="cursor:pointer;">Change Password</span>
                </div>
                <div class="personal-info-nm">
                    <input runat="server" type="password" required placeholder="Type Current Password" class="input-passwd" id="uCurrentPasswd" disabled>
                    <input runat="server" type="password" required placeholder="Enter new Password" class="input-passwd" id="uNewPasswd" disabled>
                    <input runat="server" type="password" required placeholder="Re-enter new Password" class="input-passwd" id="uConfirmNewPasswd" disabled>
                </div>

                <div class="save-button-passwd" id="savePasswdButton">
                    <!--<a href="#" class="btn btn-primary prod-slid-btn" role="button">
                        CONFIRM
                    </a>-->
                    <asp:Button Text="CONFIRM" class="btn btn-primary prod-slid-btn" runat="server" ID="btnPasswdChange" OnClick="btnPasswordChange" />
                    <a href="#" class="btn btn-primary prod-slid-btn disablePasswdChange" role="button">
                        CANCEL
                    </a>
                </div>

            </div>
        </div>

    </section>

    <script>

        $(document).ready(function () {
            var dataValue = "{ userID: '" + $("#hdnUserID").val() + "' }";
            $.ajax({
                type: "POST",
                url: "../../account/myaccount.aspx/getUserDetailList",
                contentType: "application/json; charset=utf-8",
                data: dataValue,
                dataType: "json",
                success: function (response) {
                    if (response != "" && response.d.Data != 'undefined') {
                        var parsedData = JSON.parse(response.d.Data);
                        var UserData = JSON.parse(parsedData.UserDetailList);
                        $("#uFirstName").attr("value", UserData[0].uFisrtName);
                        $("#uLastName").attr("value", UserData[0].uLastName);
                        $("#uEmailID").attr("value", UserData[0].uEmailID);
                        $("#uMobileNo").attr("value", UserData[0].uMobileNo);
                        if (UserData[0].uGender !="" && UserData[0].uGender == "M") {
                            $("#genderMale").attr("checked", "checked");
                        }
                        else if (UserData[0].uGender !="" && UserData[0].uGender == "F") {
                            $("#genderFemale").attr("checked", "checked");
                        }
                        else {
                            $("#genderNotSpecified").attr("checked", "checked");
                        };
                    }

                },
                failure: function (response) {
                    alert(response.d);
                }
            }); //Product ends 
        }); //Document Ready Ends



/**********Edit Profile Enable or Disable function Start************/

        /*Enable profile Update and disable when clicked on cancel*/
        $("#editButton").click(function () {
            $(".enableEdit").removeAttr("disabled");
            document.getElementById('editButton').style.display = "none";
            document.getElementById('saveButton').style.display = "block";
        });

        /*Enable password change and disable when clicked on cancel*/
        $(".passwdChange").click(function () {
            $(".input-passwd").removeAttr("disabled");
            document.getElementById('savePasswdButton').style.display = "block";
        });
        $(".disableProfileEdit").click(function () {
            $(".enableEdit").attr("disabled", "disabled");
            document.getElementById('editButton').style.display = "inline-block";
            document.getElementById('saveButton').style.display = "none";
        });
        $(".disablePasswdChange").click(function () {
            $(".input-passwd").attr("disabled", "disabled");
            document.getElementById('savePasswdButton').style.display = "none";
        });

/*********Edit Profile Enable or Disable function End*********/

    </script>

</asp:Content>
