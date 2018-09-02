<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="orderconfirmation.aspx.cs" Inherits="ArtCrestApplicationWeb.order.orderconfirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/css/order.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!--Order Confirmation Section-->
    <section class="order-confirm-sec">
        
        <!--Order Confirmation Message-->
        <div class="container ord-confirm-msg-block">
            <div class="ord-confirm-msg-head">
                <h2>Congratulations! Your order has been placed successfully. <br />Your Order ID is <span id="spanOrderNumber"></span>.</h2>
            </div>
            <div class="ord-confirm-msg-ship">
                <span>Expected Delivery Date: <span id="spanExpectedDeliveryDate"></span></span>
            </div>
            <div class="ord-confirm-msg-track">
                <a href="orderhistory.aspx" class="btn btn-primary prod-slid-btn track-btn" role="button">
                    Track your Orders
                </a>
            </div>
        </div>
        
        <!--Order Delivery Address Display-->
        <div class="container del-add-block">
            <div class="del-add-title">
                <span>Delivery Address</span>
            </div>
            <div class="del-add-nm">
                <span id="delvName"></span>
            </div>
            <div class="del-add-address">
                <span id="delvAddress"></span>
            </div>
            <div class="del-add-contact">
                <span>Contact No. <span id="delvMob"></span></span>
            </div>
        </div>

        <!--Order Product List Display-->
        <div class="container order-prod-list-block">
            <div class="order-prod-list-title">
                Products Ordered
            </div>
            <div id="OrderItems"></div>           
            <div class="order-prod-list">
                <div class="order-prod-tot-prc-left">
                    <a href="/home.aspx" class="btn btn-primary prod-slid-btn" role="button">
                        Shop More
                    </a>
                </div>
                <div class="order-prod-tot-prc-right">
                    <span>Total&nbsp;Cost:&nbsp;&#8377;<span id="totalAmount"></span></span>
                </div>
            </div>
        </div>

    </section>

    <script type="text/javascript">    
        $(document).ready(function () {
            getOrderConfirmationData();
        });//document ends
	</script>

</asp:Content>
