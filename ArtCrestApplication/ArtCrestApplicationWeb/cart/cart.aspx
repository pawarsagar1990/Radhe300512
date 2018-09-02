<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="ArtCrestApplication.cart.cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>My Cart - skartif</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <label id="lblEmptyCart" style="margin-top: 50px" visible="false" runat="server"><b>Oops!!Looks like your cart is empty. Please add some products to your cart. <a href="/Home.aspx">Click here</a> to view products.</b></label>
    <section class="cart-sec" id="CartSection" runat="server">
        <div class="container">
            <div class="cart-container">
                <div class="cart-title">
                    <span>My Cart (<span id="myCartItemsCount"></span>)</span>
                </div>
                <div id="cartDetails">
                </div>
            </div>
            <div class="cart-checkout-sec">
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
                <div class="cart-checkout-btn">
                    <div class="check-proc-btn">
                        <a href="/checkout/checkout.aspx" class="btn btn-primary prod-slid-btn check-btn" role="button">Proceed to Checkout
                        </a>
                    </div>
                    <div class="check-proc-btn">
                        <a href="/product/products.aspx" class="btn btn-primary prod-slid-btn check-btn" role="button">Continue Shopping</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script type="text/javascript">     
        $(document).ready(function () {
            getCartDetails();
        });///document ends
    </script>

</asp:Content>
