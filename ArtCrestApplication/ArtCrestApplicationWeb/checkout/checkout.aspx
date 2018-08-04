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
				<div class="radio check-address">
					<div class="checkout-address-button">
						<input type="radio" name="optradio" checked>&nbsp;&nbsp;Swapnil Chavan
					</div>
					<!--<div class="checkout-address-edit">
						UPDATE
					</div>-->
					<div class="checkout-address-list">
						<div class="to-address">A-908, Vihana Scoiety, Keshav Nagar, Mundhwa, Pune, Maharashtra-411036</div>
						<div class="to-mobile-no">Mob. No. +91-9075005291</div>
					</div>
				</div>
				<div class="radio check-address">
					<div class="checkout-address-button">
						<input type="radio" name="optradio" checked>&nbsp;&nbsp;Sagar Pawar
					</div>
					<!--<div class="checkout-address-edit">
						UPDATE
					</div>-->
					<div class="checkout-address-list">
						<div class="to-address">A-202, Eisha Footprint, Tathawade, Pune, Maharashtra-411046</div>
						<div class="to-mobile-no">Mob. No. +91-8675825248</div>
					</div>
				</div>
				<div class="check-address address-new-sec">
                    <a href="#newadd" data-toggle="collapse">
                        <div class="check-address-new">
					        <label>Add New Address</label>
				        </div>
                    </a>
                    <div class="address-save">
					    <label>Save</label>
				    </div>
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
                </div>
                
                <div class="pymt-sec">
                <div class="check-pymt-sec">
                    Payment Options
                </div>    
                <div class="checkout-pymt-button">
                    <input type="radio" name="optradio" onclick="showConfirmOrdButton()">&nbsp;&nbsp;Cash on Delivery
                </div>
                <div class="checkout-pymt-button">
					<input type="radio" name="optradio" onclick="showProceedPymtButton()">&nbsp;&nbsp;Paytm
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
                        <div class="cart-check-prc-right">&#8377;330</div>
				    </div>
				    <div class="cart-ord-shipping">
					    <div class="cart-check-prc-left">Shipping Charges:</div> 
                        <div class="cart-check-prc-right">&#8377;30</div>
				    </div>
				    <div class="cart-total">
					    <div class="cart-check-prc-left">Amount Payable:</div> 
                        <div class="cart-check-prc-right">&#8377;360</div>
				    </div>
                </div>
                <div class="check-ord-confirm-btn" style="display:none;" id="confirm-ord">
			        <div class="check-proc-btn">
                        <button class="btn btn-primary prod-slid-btn check-btn">Confirm Order</button>
                    </div>
                </div>
                <div class="check-ord-confirm-btn" style="display:none;" id="proceed-to-pay">
                    <div class="check-proc-btn">
                        <button class="btn btn-primary prod-slid-btn check-btn">Proceed to Pay</button>
                    </div>
                </div>
			</div>
		</div>
	</section>  
    <script>
        function showConfirmOrdButton() {
            document.getElementById('confirm-ord').style.display = "block";
            document.getElementById('proceed-to-pay').style.display = "none";
        }
        function showProceedPymtButton() {
            document.getElementById('proceed-to-pay').style.display = "block";
            document.getElementById('confirm-ord').style.display = "none";
        }
    </script>
</asp:Content>
