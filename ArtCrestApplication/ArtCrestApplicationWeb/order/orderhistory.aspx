<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="orderhistory.aspx.cs" Inherits="ArtCrestApplicationWeb.order.orderhistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/css/order.css"/>
    <link rel="stylesheet" type="text/css" href="/css/account.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <br />
    <div class="container">
        <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
        <asp:HiddenField runat="server" ID="hdnUserID" ClientIDMode="Static" />
    </div>

    <section class="order-history-sec">
        <div class="container">
            <div class="myaccount-header">
                <div class="myaccount-header-link">
                    <a href="/account/myaccount.aspx">My Profile</a>
                </div>
                <div class="myaccount-header-link">
                    <a href="/account/manageaddresses.aspx">My Addresses</a>
                </div>
                <div class="myaccount-header-link active">
                    <a href="orderhistory.aspx">My Orders</a>
                </div>
            </div>

            <div id="orderHistory">

                <!--<div class="order-history-list-wrap">
                    <div class="order-history-block">
                        <div class="order-history-ref">
                            <div class="order-history-ref-number">
                                <a href="#" class="btn btn-primary prod-slid-btn track-btn" role="button">ORD1154
                                </a>
                            </div>
                            <div class="order-history-ref-date">
                                <span>Order Date: Aug 6, 2018
                                </span>
                            </div>
                            <div class="order-history-ref-pymt">
                                <span>Order Amount:&nbsp;&#8377;450
                                </span>
                            </div>
                            <div class="order-history-ref-track">
                                <a href="#" class="btn btn-primary prod-slid-btn track-btn" role="button">Track
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="order-history-prod-list">
                        <div class="order-history-prod-img">
                            <a href="#">
                                <img src="/images/cart-img-1.jpg" class="cart-img-product"></a>
                        </div>
                        <div class="order-history-prod-nm">
                            <a href="#"><span>SR136 Chota Bhim Rakhi for Chidren</span></a>
                        </div>
                        <div class="order-history-prod-qty">
                            <span>Qty: 2</span>
                        </div>
                        <div class="order-history-prod-status">
                            <span>Delivered on: Thu, Aug 6th 2018</span>
                        </div>
                        <div class="order-history-prod-prc">
                            <span>Price:&nbsp;&#8377;210</span>
                        </div>
                    </div>

                    <div class="order-history-prod-list">
                        <div class="order-history-prod-img">
                            <a href="#">
                                <img src="/images/cart-img-1.jpg" class="cart-img-product"></a>
                        </div>
                        <div class="order-history-prod-nm">
                            <a href="#"><span>Set of 12 Diyas red coloured</span></a>
                        </div>
                        <div class="order-history-prod-qty">
                            <span>Qty: 1</span>
                        </div>
                        <div class="order-history-prod-status">
                            <span>Cancelled</span>
                        </div>
                        <div class="order-history-prod-prc">
                            <span>Price:&nbsp;&#8377;240</span>
                        </div>
                    </div>


                </div>


                <div class="order-history-list-wrap">
                    <div class="order-history-block">
                        <div class="order-history-ref">
                            <div class="order-history-ref-number">
                                <a href="#" class="btn btn-primary prod-slid-btn track-btn" role="button">ORD1043
                                </a>
                            </div>
                            <div class="order-history-ref-date">
                                <span>Order Date: Jun 13, 2018
                                </span>
                            </div>
                            <div class="order-history-ref-pymt">
                                <span>Order Amount:&nbsp;&#8377;210
                                </span>
                            </div>
                            <div class="order-history-ref-track">
                                <a href="#" class="btn btn-primary prod-slid-btn track-btn" role="button">Track
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="order-history-prod-list">
                        <div class="order-history-prod-img">
                            <a href="#">
                                <img src="/images/cart-img-1.jpg" class="cart-img-product"></a>
                        </div>
                        <div class="order-history-prod-nm">
                            <a href="#"><span>SR136 Chota Bhim Rakhi for Chidren</span></a>
                        </div>
                        <div class="order-history-prod-qty">
                            <span>Qty: 2</span>
                        </div>
                        <div class="order-history-prod-status">
                            <span>Delivered on: Thu, Aug 6th 2018</span>
                        </div>
                        <div class="order-history-prod-prc">
                            <span>Price:&nbsp;&#8377;210</span>
                        </div>
                    </div>

                </div>-->
            </div>

        </div>
    </section>

    <script>

        $(document).ready(function () {
            var dataValue = "{ userID: '" + $("#hdnUserID").val() + "' }";
            $.ajax({
                type: "POST",
                url: "../../order/orderhistory.aspx/getOrderList",
                contentType: "application/json; charset=utf-8",
                data: dataValue,
                dataType: "json",
                success: function (response) {
                    if (response != "" && response.d.Data != 'undefined') {
                        var parsedData = JSON.parse(response.d.Data);
                        var OrderList = JSON.parse(parsedData.OrderList);
                        var OrderItemsLits = JSON.parse(parsedData.OrderItemsLits);
                        var divHtml = "";
                        if (OrderList != null && OrderList != undefined) {
                            $.each(OrderList, function (key, OrderList) {
                                divHtml = "<div class='order-history-list-wrap'><div class='order-history-block'><div class='order-history-ref'>"
                                    +"<div class='order-history-ref-number'><a href='#' class='btn btn-primary prod-slid-btn track-btn' role='button'>ORD"+ OrderList.oID +"</a></div>"
                                    +"<div class='order-history-ref-date'><span>Order Date: "+ OrderList.oCreatedDate +"</span></div>"
                                    +"<div class='order-history-ref-pymt'><span>Order Amount:&nbsp;&#8377;"+ OrderList.oTotalAmt +"</span></div>"
                                    +"<div class='order-history-ref-track' style='display:none;'><a href='#' class='btn btn-primary prod-slid-btn track-btn' role='button'>Track</a></div></div></div>";
                                var eachOrderItemDiv = "";
                                $.each(OrderItemsLits, function (key, OrderItemsLits) {
                                    var orderstatus = "";
                                    if (OrderItemsLits.otStatus == 'Delivered') {
                                        orderstatus = OrderItemsLits.otStatus + " on " + OrderItemsLits.otDeliveryDate;
                                    }
                                    else {
                                        orderstatus = OrderItemsLits.otStatus;
                                    }
                                    if (OrderList.oID == OrderItemsLits.oID) {
                                        eachOrderItemDiv = eachOrderItemDiv + "<div class='order-history-prod-list'><div class='order-history-prod-img'>"
                                            + "<a target='_blank' href='/product/productdetail.aspx?pid=" + OrderItemsLits.pPID + "'><img src='/productimages/" + OrderItemsLits.pImageLink + "' class='cart-img-product'></a></div>"
                                            + "<div class='order-history-prod-nm'><a target='_blank' href='/product/productdetail.aspx?pid=" + OrderItemsLits.pPID + "'><span>" + OrderItemsLits.pPName + "</span></a></div>"
                                            + "<div class='order-history-prod-qty'><span>Qty: " + OrderItemsLits.opQuantity + "</span></div>"
                                            + "<div class='order-history-prod-status'><span>" + orderstatus + "</span></div>"
                                            + "<div class='order-history-prod-prc'><span>Price:&nbsp;&#8377;" + OrderItemsLits.opFinalPrice + "</span></div></div>";
                                    }//subcat if loop ends     
                                });
                                divHtml = divHtml + eachOrderItemDiv + "</div>";
                                $("#orderHistory").append(divHtml);
                            });

                        }
                    }
                    
                },
                failure: function (response) {
                    alert(response.d);
                }
            }); //Product ends            
        });

    </script>

</asp:Content>
