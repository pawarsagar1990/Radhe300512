<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="orderhistory.aspx.cs" Inherits="ArtCrestApplicationWeb.order.orderhistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/css/order.css"/>
    <link rel="stylesheet" type="text/css" href="/css/account.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
            
            <div class="order-history-list-wrap">
                <div class="order-history-block">
                    <div class="order-history-ref">
                        <div class="order-history-ref-number">
                            <a href="#" class="btn btn-primary prod-slid-btn track-btn" role="button">
                                ORD1154
                            </a>
                        </div>
                        <div class="order-history-ref-date">
                            <span>
                                Order Date: Aug 6, 2018
                            </span>
                        </div>
                        <div class="order-history-ref-pymt">
                            <span>
                                Order Amount:&nbsp;&#8377;450
                            </span>
                        </div>
                        <div class="order-history-ref-track">
                            <a href="#" class="btn btn-primary prod-slid-btn track-btn" role="button">
                                Track
                            </a>
                        </div>
                    </div>
                </div>

                <div class="order-history-prod-list">
                    <div class="order-history-prod-img">
                        <a href="#"><img src="/images/cart-img-1.jpg" class="cart-img-product"></a>
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
                        <a href="#"><img src="/images/cart-img-1.jpg" class="cart-img-product"></a>
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
                            <a href="#" class="btn btn-primary prod-slid-btn track-btn" role="button">
                                ORD1043
                            </a>
                        </div>
                        <div class="order-history-ref-date">
                            <span>
                                Order Date: Jun 13, 2018
                            </span>
                        </div>
                        <div class="order-history-ref-pymt">
                            <span>
                                Order Amount:&nbsp;&#8377;210
                            </span>
                        </div>
                        <div class="order-history-ref-track">
                            <a href="#" class="btn btn-primary prod-slid-btn track-btn" role="button">
                                Track
                            </a>
                        </div>
                    </div>
                </div>

                <div class="order-history-prod-list">
                    <div class="order-history-prod-img">
                        <a href="#"><img src="/images/cart-img-1.jpg" class="cart-img-product"></a>
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

            </div>

        </div>
    </section>
</asp:Content>
