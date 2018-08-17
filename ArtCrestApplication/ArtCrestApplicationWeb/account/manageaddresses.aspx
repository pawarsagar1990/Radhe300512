<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="manageaddresses.aspx.cs" Inherits="ArtCrestApplicationWeb.account.manageaddresses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/css/account.css"/>
    <link rel="stylesheet" type="text/css" href="/css/checkout.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="account-sec">
        <div class="container">
            <!--Header Navigation-->
            <div class="myaccount-header">
                <div class="myaccount-header-link">
                    <a href="myaccount.aspx">My Profile</a>
                </div>
                <div class="myaccount-header-link active">
                    <a href="manageaddresses.aspx">My Addresses</a>
                </div>
                <div class="myaccount-header-link">
                    <a href="/order/orderhistory.aspx">My Orders</a>
                </div>
            </div>

            <!--Add new address section-->

            <div class="add-new-address">
               <div class="check-address-new" onclick="enableAddressAddition()">
					    <label>Add New Address</label>
			   </div>
                
                <div id="newadd" class="collapse form-new-add">
                    <div class="form-new-add-1">
                        <input class="form-new-add-nm" placeholder="Name" type="text" required>
                        <input class="form-new-add-mob" placeholder="Mobile Number (10 Digit)" type="text" required>
                    </div>
                    
                    <div class="form-new-add-1">
                        <input class="form-new-add-str" placeholder="Detailed Address(Flat/House No, Building/Society, Street Name)" type="text" required>
                    </div>
                    <div class="form-new-add-1">
                        <input class="form-new-add-nm" placeholder="PIN Code" type="text" required>
                        <input class="form-new-add-mob" placeholder="Area/Locality" type="text" >
                    </div>
                    <div class="form-new-add-1">
                        <input class="form-new-add-str" placeholder="Nearest Landmark" type="text">
                    </div>
                    <div class="form-new-add-1">
                        <input class="form-new-add-nm" placeholder="City/District" type="text" required>
                        <select class="form-new-add-mob" id="sel1">
                            <option value="">Select State</option>
                            <option value="Maharashtra">Maharashtra</option>
                            <option value="Delhi">Delhi</option>
                            <option value="Goa">Goa</option>
                            <option value="Gujrath">Gujrath</option>
                        </select>
                    </div>
                    <div class="address-edit-buttons">
                        <div class="address-edit-button">
                            <a href="#" class="btn btn-primary prod-slid-btn" role="button">
                                Save
                            </a>
                        </div>
                        <div class="address-edit-button">
                            <a href="#" class="btn btn-primary prod-slid-btn" role="button" onclick="disableAddressAddition()">
                                Cancel
                            </a>
                        </div>
                        </div>
                    </div>
                
            </div>

            <!--*****Existing Address List Display*****-->

            <!--Address 1 Dispaly-->
            <div class="user-address-list" id="addressDisplay1">
                <div class="user-addess-line1">
                    <div class="user-address-line1-left">
                        Swapnil Chavan
                    </div>
                    <div class="user-address-line1-right">
                        <button onclick="enableAddressEdit1()">EDIT</button>
                    </div>
                </div>
                <div class="user-address-line2">
                    A-908, Vihana Scoiety, Keshav Nagar, Near Orbis School, Mundhwa, Pune, Maharashtra - 411036
                </div>
                <div class="user-address-line3">
                    Mob. +91-9075005291
                </div>
            </div>

            <!--Address 1 Edit Section-->
            <div class="edit-add-list" id="addressEdit1">
                <div class="edit_add_list">
                    EDIT Address
                </div>
                <div class="form-new-add-1">
                    <input class="form-new-add-nm" placeholder="Swapnil Chavan" type="text" required>
                    <input class="form-new-add-mob" placeholder="9075005291" type="text" required>
                </div>
                    
                <div class="form-new-add-1">
                    <input class="form-new-add-str" placeholder="A-908, Vihana Society, Keshav Nagar" type="text" required>
                </div>
                <div class="form-new-add-1">
                    <input class="form-new-add-nm" placeholder="PIN Code" type="text" required>
                    <input class="form-new-add-mob" placeholder="Mundhwa" type="text" >
                </div>
                <div class="form-new-add-1">
                    <input class="form-new-add-str" placeholder="Near Orbis School" type="text">
                </div>
                <div class="form-new-add-1">
                    <input class="form-new-add-nm" placeholder="Pune" type="text" required>
                    <select class="form-new-add-mob" id="selectstate1">
                        <option value="">Select State</option>
                        <option value="Maharashtra" selected>Maharashtra</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Goa">Goa</option>
                        <option value="Gujrath">Gujrath</option>
                    </select>
                </div>
                <div class="address-edit-buttons">
                    <div class="address-edit-button">
                        <a href="#" class="btn btn-primary prod-slid-btn" role="button">
                            Save
                        </a>
                    </div>
                    <div class="address-edit-button">
                        <a href="#" class="btn btn-primary prod-slid-btn" role="button" onclick="disableAddressEdit1()">
                            Cancel
                        </a>
                    </div>
                </div>
             </div>


            <!--Address 1 Display-->
            <div class="user-address-list" id="addressDisplay2">
                <div class="user-addess-line1">
                    <div class="user-address-line1-left">
                        Sagar Pawar
                    </div>
                    <div class="user-address-line1-right">
                        <button onclick="enableAddressEdit2()">EDIT</button>
                    </div>
                </div>
                <div class="user-address-line2">
                    A-204, Eisha Footprint, Tathawade, Pune, Maharashtra - 411042
                </div>
                <div class="user-address-line3">
                    Mob. +91-8695875625
                </div>
            </div>
            <!--Address 2 Edit Section-->
            <div class="edit-add-list" id="addressEdit2">
                <div class="edit_add_list">
                    EDIT Address
                </div>
                <div class="form-new-add-1">
                    <input class="form-new-add-nm" placeholder="Sagar Pawar" type="text" required>
                    <input class="form-new-add-mob" placeholder="8695875625" type="text" required>
                </div>
                    
                <div class="form-new-add-1">
                    <input class="form-new-add-str" placeholder="A-204, Eisha Footprint" type="text" required>
                </div>
                <div class="form-new-add-1">
                    <input class="form-new-add-nm" placeholder="411042" type="text" required>
                    <input class="form-new-add-mob" placeholder="Tathawade" type="text" >
                </div>
                <div class="form-new-add-1">
                    <input class="form-new-add-str" placeholder="Nearest Landmark" type="text">
                </div>
                <div class="form-new-add-1">
                    <input class="form-new-add-nm" placeholder="Pune" type="text" required>
                    <select class="form-new-add-mob" id="selectstate2">
                        <option value="">Select State</option>
                        <option value="Maharashtra" selected>Maharashtra</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Goa">Goa</option>
                        <option value="Gujrath">Gujrath</option>
                    </select>
                </div>
                <div class="address-edit-buttons">
                    <div class="address-edit-button">
                        <a href="#" class="btn btn-primary prod-slid-btn" role="button">
                            Save
                        </a>
                    </div>
                    <div class="address-edit-button">
                        <a href="#" class="btn btn-primary prod-slid-btn" role="button" onclick="disableAddressEdit2()">
                            Cancel
                        </a>
                    </div>
                </div>
             </div>

        </div>
    </section>

    <script>
        //Function for adding new address
        function disableAddressAddition() {
            document.getElementById('newadd').style.display = "none";
        }
        function enableAddressAddition() {
            document.getElementById('newadd').style.display = "block";
        }
        //Function for Address EDIT 1
        function enableAddressEdit1() {
            document.getElementById('addressEdit1').style.display = "block";
            document.getElementById('addressDisplay1').style.display = "none";
        }
        function disableAddressEdit1() {
            document.getElementById('addressDisplay1').style.display = "block";
            document.getElementById('addressEdit1').style.display = "none";
        }

        //Function for Address EDIT 2
        function enableAddressEdit2() {
            document.getElementById('addressEdit2').style.display = "block";
            document.getElementById('addressDisplay2').style.display = "none";
        }
        function disableAddressEdit2() {
            document.getElementById('addressDisplay2').style.display = "block";
            document.getElementById('addressEdit2').style.display = "none";
        }
    </script>

</asp:Content>
