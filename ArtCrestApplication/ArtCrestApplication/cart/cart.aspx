<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="ArtCrestApplication.cart.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
				<div class="cart-subtotal">
					Sub Total: &#8377;330
				</div>
				<div class="cart-ord-shipping">
					Shipping Charges: &#8377;30
				</div>
				<div class="cart-total">
					Total amount to be paid: &#8377;360
				</div>
				<div class="cart-checkout-btn">
					<button class="btn btn-primary prod-slid-btn">Proceed to Checkout</button>
					<button class="btn btn-primary prod-slid-btn">Continue Shopping</button>
				</div>
			</div>
		</div>
	</section>
</asp:Content>
