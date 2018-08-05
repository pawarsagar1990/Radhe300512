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
                <h2>Congratulations! Your order has been placed successfully.</h2>
            </div>
            <div class="ord-confirm-msg-ship">
                <span>Expected Delivery Date: Wed, Aug 8 2018</span>
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
                <span>Swapnil Chavan</span>
            </div>
            <div class="del-add-address">
                <span>A-908, Vihana Society, Keshav Nagar, Mundhwa, Pune, Maharashtra, - 411036</span>
            </div>
            <div class="del-add-contact">
                <span>Contact No. +91-9075005291</span>
            </div>
        </div>

        <!--Order Product List Display-->
        <div class="container order-prod-list-block">
            <div class="order-prod-list-title">
                Products Ordered
            </div>
            <div class="order-prod-list">
                <div class="order-prod-img">
                    <a href="#"><img src="/images/cart-img-1.jpg" class="cart-img-product"></a>
                </div>
                <div class="order-prod-nm">
                    <a href="#"><span>SR136 Chota Bhim Rakhi for Chidren</span></a>
                </div>
                <div class="order-prod-qty">
                    <span>Qty: 2</span>
                </div>
                <div class="order-prod-prc">
                    <span>Price:&nbsp;&#8377;210</span>
                </div>
            </div>
            <hr />
            <div class="order-prod-list">
                <div class="order-prod-img">
                    <a href="#"><img src="/images/cart-img-1.jpg" class="cart-img-product"></a>
                </div>
                <div class="order-prod-nm">
                    <a href="#"><span>Set of 12 Diyas red coloured</span></a>
                </div>
                <div class="order-prod-qty">
                    <span>Qty: 1</span>
                </div>
                <div class="order-prod-prc">
                    <span>Price:&nbsp;&#8377;240</span>
                </div>
            </div>
            <hr />
            <div class="order-prod-list">
                <div class="order-prod-tot-prc-left">
                    <a href="/order/orderconfirmation.aspx" class="btn btn-primary prod-slid-btn" role="button">
                        Shop More
                    </a>
                </div>
                <div class="order-prod-tot-prc-right">
                    <span>Total&nbsp;Cost:&nbsp;&#8377;450</span>
                </div>
            </div>
        </div>

    </section>

    <!--Other product slider-->
    <section class="product-slider">
		<div class="container mt-4">
			<div class="row">
				<div class="col-md-12 text-center">
					<span class="product-slider-title">Products you may be interested in</span>
				</div>
			</div>
		</div>
		
		<div class="container mt-3">
			<div class="row">
				<div class="owl-carousel owl-theme">
					
					<div class="item">
						<div class="card">
							<img src="/images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Diya 1</h3>
								<h5 class="prod-slid-prc"><span class="prod_disc_prc">&#8377;&nbsp;135&nbsp;&nbsp;</span><span class="prod_sale_prc">&#8377;&nbsp;149</span><span class="prod_disc_per">&nbsp;&nbsp;10% off</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="/images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">A set of 12 diyas decorated and designed in red colour</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">40</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="/images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Diya 3</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">120</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="/images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">SaptDiya 4</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">60</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="/images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Diya 5</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">84</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="/images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Diya 6</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">40</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="/images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 7</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">74</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="/images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 8</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">49</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="/images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 9</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">149</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="/images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 10</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">40</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</section>

    <script type="text/javascript">
	$('.owl-carousel').owlCarousel({
    margin:20,
	loop:true,
    nav:true,
	navText:['<i class="fa fa-angle-left" style="font-size:48px;"></i>','<i class="fa fa-angle-right" style="font-size:48px;"></i>'],
    responsive:{
        0:{
            items:1
        },
		100:{
            items:2
        },
        600:{
            items:3
        },
        1000:{
            items:5
        }
    }
	})
	</script>

</asp:Content>
