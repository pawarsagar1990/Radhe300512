<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="ArtCrestApplication.cart.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>My Cart - skartif</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="cart-sec">
		<div class="container">
			<div class="cart-container">
				<div class="cart-title">
					<span>My Cart (2 Items)</span>
				</div>
				<div class="cart-list-sec">
					<div class="cart-prod-dtl">
						<div class="cart-prod-dtl-img">
							<a href="#"><img src="/images/cart-img-1.jpg" class="cart-img-product"></a>
						</div>
						<div class="cart-prod-dtl-nm">
							<a href="#"><span>SR136 Chota Bhim Rakhi for Chidren</span></a>
						</div>
						<div class="cart-prod-qty">
							<div class="flex-w bo5 of-hidden w-size17">
								<button class="btn-num-product-down color1 flex-c-m size7 bg8 eff2">
									<i class="fs-12 fa fa-minus" aria-hidden="true"></i>
								</button>

								<input class="size8 m-text18 t-center num-product" type="number" name="num-product1" value="1">

								<button class="btn-num-product-up color1 flex-c-m size7 bg8 eff2">
									<i class="fs-12 fa fa-plus" aria-hidden="true"></i>
								</button>
							</div>
						</div>
						<div class="cart-prod-price">
						&#8377;120
						</div>
					</div>	
					<div class="cart-prod-remove">
						<button class="btn btn-primary prod-slid-btn">Remove from cart</button>
					</div>
				</div>
				<div class="cart-list-sec">
					<div class="cart-prod-dtl">
						<div class="cart-prod-dtl-img">
							<a href="#"><img src="/images/cart-img-1.jpg" class="cart-img-product"></a>
						</div>
						<div class="cart-prod-dtl-nm">
							<a href="#"><span>A Set of 10 Diays red coloured specially decorated</span></a>
						</div>
						<div class="cart-prod-qty">
							<div class="flex-w bo5 of-hidden w-size17">
								<button class="btn-num-product-down color1 flex-c-m size7 bg8 eff2">
									<i class="fs-12 fa fa-minus" aria-hidden="true"></i>
								</button>

								<input class="size8 m-text18 t-center num-product" type="number" name="num-product1" value="1">

								<button class="btn-num-product-up color1 flex-c-m size7 bg8 eff2">
									<i class="fs-12 fa fa-plus" aria-hidden="true"></i>
								</button>
							</div>
						</div>
						<div class="cart-prod-price">
						&#8377;210
						</div>
					</div>	
					<div class="cart-prod-remove">
						<button class="btn btn-primary prod-slid-btn">Remove from cart</button>
					</div>	
				</div>
			</div>
			<div class="cart-checkout-sec">
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
				<div class="cart-checkout-btn">
					<div class="check-proc-btn">
                        <a href="~/checkout/checkout.aspx"><button class="btn btn-primary prod-slid-btn check-btn">Proceed to Checkout</button></a>
                    </div>
                    <div class="check-proc-btn">
					    <button class="btn btn-primary prod-slid-btn check-btn">Continue Shopping</button>
                    </div>
				</div>
			</div>
		</div>
	</section>
    <!-- Relate Product -->
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
