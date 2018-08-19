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
                <%--<div class="radio check-address">
                    <div class="checkout-address-button">
                        <input type="radio" name="optradio">&nbsp;&nbsp;Swapnil Chavan
                    </div>                   
                    <div class="checkout-address-list">
                        <div class="to-address">A-908, Vihana Scoiety, Keshav Nagar, Mundhwa, Pune, Maharashtra-411036</div>
                        <div class="to-mobile-no">Mob. No. +91-9075005291</div>
                    </div>
                </div>--%>
                <%--                <div class="radio check-address">
                    <div class="checkout-address-button">
                        <input type="radio" name="optradio">&nbsp;&nbsp;Sagar Pawar
                    </div>
                    <!--<div class="checkout-address-edit">
						UPDATE
					</div>-->
                    <div class="checkout-address-list">
                        <div class="to-address">A-202, Eisha Footprint, Tathawade, Pune, Maharashtra-411046</div>
                        <div class="to-mobile-no">Mob. No. +91-8675825248</div>
                    </div>
                </div>--%>
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
                    <%--<div class="checkout-pymt-button">
                        <input type="radio" name="optpaymtmethod" onclick="showProceedPymtButton()">&nbsp;&nbsp;Paytm
                    </div>--%>
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
                        <%--<a href="/order/orderconfirmation.aspx" class="btn btn-primary prod-slid-btn check-btn" role="button">Confirm Order
                        </a>--%>
                        <%--<asp:Button runat="server" ID="btnConfirmOrder" OnClick="btnConfirmOrder_Click" OnClientClick="return btnConfirmOrderClientClick();" class="btn btn-primary prod-slid-btn check-btn" Text="Confirm Order" ClientIDMode="Static" />--%>
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
        }
        function showProceedPymtButton() {
            //document.getElementById('proceed-to-pay').style.display = "block";
            document.getElementById('confirm-ord').style.display = "none";
        }

        $(document).ready(function () {
            getCartDetails();
            getAddresses();
            getState();
            showConfirmOrdButton();
        });///document ends


        function getCartDetails() {
            $.ajax({
                type: "POST",
                url: "../../Cart/Cart.aspx/getCartDetails",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response != "" && response.d.Data != 'undefined') {
                        var parsedData = JSON.parse(response.d.Data);
                        var cDetails = JSON.parse(parsedData.cDetail);
                        var cIDetails = JSON.parse(parsedData.cIDetails);
                        $("#spanSubTotal").html(JSON.parse(parsedData.cISubTotal));
                        $("#spanShippingCharges").html(JSON.parse(parsedData.cIShippingCharges));
                        $("#spanTotalAmount").html(JSON.parse(parsedData.cITotaAmount));
                    }
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        };//getcartdetails ends

        function getState() {
            $.ajax({
                type: "POST",
                url: "../../checkout/checkout.aspx/getState",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response != "" && response.d.Data != 'undefined') {
                        var parsedData = JSON.parse(response.d.Data);
                        var stateList = JSON.parse(parsedData.stateList);
                        $.each(stateList, function (key, stateList) {
                            $("#drpState").append("<option value='" + stateList.sID + "'>" + stateList.sName + "</option>");
                        });//each ends
                    }//if response ends
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        };//getcartdetails ends


        //name, mobileID, address, pinCode, areaLocality, landMark, city, stateID, stateName
        function saveAddress() {
            var dataValue = "{ name: '" + $("#txtName").val() + "', mobileID : '" + $("#txtMob").val() + "', address : '" + $("#txtAddress").val() + "', pinCode: '" + $("#txtPinCode").val() + "', areaLocality : '" + $("#txtArea").val() + "', landMark : '" + $("#txtLandMark").val() + "', city : '" + $("#txtCity").val() + "', stateID : '" + $("#drpState").val() + "',stateName : '" + $("#drpState option:selected").text() + "' }";
            $.ajax({
                type: "POST",
                url: "../../checkout/checkout.aspx/saveAddress",
                contentType: "application/json; charset=utf-8",
                data: dataValue,
                dataType: "json",
                success: function (response) {
                    if (response != "" && response.d.Data != 'undefined') {
                        var parsedData = JSON.parse(response.d.Data);
                        var successAddressSave = JSON.parse(parsedData.successAddressSave);
                        if (successAddressSave != true) {
                            swal({ text: "Ooops! looks like there was error while saving address. Please try again." });
                        }
                        else {
                            $("#addNewAddress").trigger("click");
                            getAddresses();
                            clearAllBoxes();
                        }
                    }
                },
                failure: function (response) {
                    alert(response.d);
                }
            }); //update cart  ajax ends
        };//fn updatecart

        function getAddresses() {
            $.ajax({
                type: "POST",
                url: "../../checkout/checkout.aspx/getUserAddresses",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response != "" && response.d.Data != 'undefined') {
                        var parsedData = JSON.parse(response.d.Data);
                        var addressList = JSON.parse(parsedData.addressList);
                        var divHtml = "";
                        $("#addressDiv").empty();
                        $.each(addressList, function (key, addressList) {
                            var radioSelected = "";
                            if (key == 0) { radioSelected = "checked = 'checked'"; $("#selectedAddress").val(addressList.uDID); }
                            divHtml = "<div class='radio check-address'>" +
                                    "<div class='checkout-address-button'><input id='userAddressID" + addressList.uDID + "' onclick='selectAddress(" + addressList.uDID + ");' type='radio' " + radioSelected + " name='optradio'>&nbsp;&nbsp;" + addressList.uDName + "</div>" +
                                    "<div class='checkout-address-list'>" +
                                    "<div class='to-address'>" + addressList.uDAddress + ", " + addressList.uDAreaLocality + ", " + addressList.uDLandmark +
                                     ", " + addressList.uDCity + ", " + addressList.uDState + "- " + addressList.uDPinCode + "</div>" +
                                    "<div class='to-mobile-no'>Mob. No. +91-" + addressList.uDmob + "</div>" +
                                    "</div></div>";
                            $("#addressDiv").append(divHtml);
                        });//each ends
                    }//if response ends
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        function clearAllBoxes() {
            $("#txtName").val("");
            $("#txtMob").val("");
            $("#txtAddress").val("");
            $("#txtPinCode").val("");
            $("#txtArea").val("");
            $("#drpState").val("1");
            $("#txtCity").val("");
            $("#txtLandMark").val("");
        }


        function btnConfirmOrderClientClick() {
            if ($("#selectedAddress") && $("#selectedAddress").val() != "") {
                swal({
                    title: "Are you sure you want to place order along with selected items and address?",
                    text: "Once you place order, we will get back to you on your registered Email ID and Mobile Number.",
                    icon: "warning",
                    cancelButtonColor: "#DD6B55",
                    confirmButtonColor: "#DD6B55",
                    showLoaderOnConfirm: true,
                    buttons: {
                        cancel: {
                            text: "Cancel",
                            value: false,
                            visible: true,
                            className: "",
                            dangerMode: true,
                            closeModal: true
                        },
                        confirm: {
                            text: "Yes, Confirm Order",
                            value: true,
                            visible: true,
                            className: "",
                            closeModal: false,
                            successMode: true
                        }
                    },
                    dangerMode: true,
                })
            .then((yesSure) => {
                if (yesSure) {
                    if ($("#selectedAddress") && $("#selectedAddress").val() != "") {
                        swal({
                            title: 'Order Placing is in progress!Wait till next page appears, We are working on your request.',                            
                            timer: 20000,
                            buttons: false,
                            onOpen: () => {
                                swal.showLoading();
                            }
                        });
                        var dataValue = "{ address: '" + $("#selectedAddress").val() + "'}";
                        $.ajax({
                            type: "POST",
                            url: "../../checkout/checkout.aspx/confirmOrder",
                            contentType: "application/json; charset=utf-8",
                            data: dataValue,
                            dataType: "json",
                            success: function (response) {
                                if (response != "" && response.d.Data != 'undefined') {
                                    var parsedData = JSON.parse(response.d.Data);
                                    var orderDetail = JSON.parse(parsedData.orderDetail);
                                    if (orderDetail && orderDetail.length > 0)
                                    { window.location.href = "/order/orderconfirmation.aspx?oID=" + orderDetail[0].oOID; }
                                    else {
                                        swal({
                                            text: "Ooops! Something went wrong. Please try again with proper inputs.",
                                            icon: "warning",
                                            buttons: false,
                                            dangerMode: true,
                                        });
                                    }                                    
                                }//if response ends
                            },
                            failure: function (response) {
                                alert(response.d);
                            }
                        });
                    }
                    else {
                        swal({
                            text: "Ooops! Looks like you have not selected address for your order. Please select any address from your existing address list else add New Address.",
                            icon: "warning",
                            buttons: false,
                            dangerMode: true,
                        });
                    }
                }
                else { return false; }
            });///swal ends      
            }//select address ends     
            else {
                swal({
                    text: "Ooops! Looks like you have not selected address for your order. Please select any address from your existing address list else add New Address.",
                    icon: "warning",
                    buttons: false,
                    dangerMode: true,
                });
            }
        }//btnconfirmorder ends




        function selectAddress(selectedAddress) {
            $("#selectedAddress").val(selectedAddress);
        }//selectAddres ends


    </script>
</asp:Content>
