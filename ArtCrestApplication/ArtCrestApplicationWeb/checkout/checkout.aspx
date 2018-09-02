<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="ArtCrestApplication.checkout.checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/css/checkout.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="checkout-sec">
        <div class="container">
            <div class="checkout-container">
                <div class="check-title">
                    <span>Select Delivery Address</span>
                </div>
                <div id="addressDiv"></div>
                <div class="check-address address-new-sec">
                    <a href="#newadd" id="addNewAddress" data-toggle="collapse">
                        <div class="check-address-new">
                            <label>Add New Address</label>
                        </div>
                    </a>
                    <div class="address-save">
                        <label style="cursor: pointer;" onclick="saveAddress();">Save</label>
                    </div>
                </div>
                <div id="newadd" class="collapse form-new-add">
                    <div class="form-new-add-1">
                        <input class="form-new-add-nm" id="txtName" placeholder="Name" type="text">
                        <input id="txtMob" class="form-new-add-mob" placeholder="Mobile Number (10 Digit)" type="text">
                    </div>

                    <div class="form-new-add-1">
                        <input id="txtAddress" class="form-new-add-str" placeholder="Detailed Address(Flat/House No, Building/Society, Street Name)" type="text">
                    </div>
                    <div class="form-new-add-1">
                        <input id="txtPinCode" class="form-new-add-nm" placeholder="PIN Code" type="text">
                        <input id="txtArea" class="form-new-add-mob" placeholder="Area/Locality" type="text">
                    </div>
                    <div class="form-new-add-1">
                        <input class="form-new-add-str" id="txtLandMark" placeholder="Nearest Landmark" type="text">
                    </div>
                    <div class="form-new-add-1">
                        <input class="form-new-add-nm" placeholder="City/District" id="txtCity" type="text">
                        <select class="form-new-add-mob" id="drpState">
                        </select>
                    </div>
                </div>

                <div class="pymt-sec">
                    <div class="check-pymt-sec">
                        Payment Options
                    </div>
                    <div class="checkout-pymt-button">
                        <input type="radio" name="optpaymtmethod" checked="checked" onclick="showConfirmOrdButton()">&nbsp;&nbsp;Cash on Delivery
                    </div>                    
                </div>

            </div>

            <div class="checkout-pymt-sec">
                <div class="cart-checkout-title">
                    Payment Details
                </div>
                <div class="cart-payment-dtl">
                    <div class="cart-subtotal">
                        <div class="cart-check-prc-left">Sub Total:</div>
                        <div class="cart-check-prc-right">&#8377;<span id="spanSubTotal"></span></div>
                    </div>
                    <div class="cart-ord-shipping">
                        <div class="cart-check-prc-left">Shipping Charges:</div>
                        <div class="cart-check-prc-right">&#8377;<span id="spanShippingCharges"></span></div>
                    </div>
                    <div class="cart-total">
                        <div class="cart-check-prc-left">Amount Payable:</div>
                        <div class="cart-check-prc-right">&#8377;<span id="spanTotalAmount"></span></div>
                    </div>
                </div>
                <div class="check-ord-confirm-btn" style="display: none;" id="confirm-ord">
                    <div class="check-proc-btn">                        
                        <button id="btnConfirmOrder" class="btn btn-primary prod-slid-btn check-btn" type="button" value="Confirm Order" onclick="btnConfirmOrderClientClick();">Confirm Order</button>
                    </div>
                </div>
                <%--                <div class="check-ord-confirm-btn" style="display: none;" id="proceed-to-pay">
                    <div class="check-proc-btn">
                        <a href="#" class="btn btn-primary prod-slid-btn check-btn" role="button">Proceed to Pay
                        </a>
                    </div>
                </div>--%>
            </div>
        </div>
        <asp:HiddenField ClientIDMode="Static" ID="selectedAddress" runat="server" />
    </section>
    <script>
        function showConfirmOrdButton() {
            document.getElementById('confirm-ord').style.display = "block";
            //document.getElementById('proceed-to-pay').style.display = "none";
        };

        function showProceedPymtButton() {
            //document.getElementById('proceed-to-pay').style.display = "block";
            document.getElementById('confirm-ord').style.display = "none";
        };

        $(document).ready(function () {
            getCartDetails();
            getAddresses();
            getState();
            showConfirmOrdButton();
        });///document ends        

    </script>
</asp:Content>
