<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="ArtCrestApplication.cart.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>My Cart - skartif</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <label id="lblEmptyCart" style="margin-top:50px" visible="false" runat="server"><b>Oops!!Looks like your cart is empty. Please add some products to your cart. <a href="/Home.aspx">Click here</a> to view products.</b></label>
    <section class="cart-sec" id="CartSection" runat="server">
		<div class="container">            
			<div class="cart-container">
				<div class="cart-title">
					<span>My Cart (<span id="myCartItemsCount"></span>)</span>
				</div>
                <div id="cartDetails">
                    <%--<div class="cart-list-sec">
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
				</div>--%>                    
                </div>				
				<%--<div class="cart-list-sec">
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
				</div>--%>
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
                        <a href="/checkout/checkout.aspx" class="btn btn-primary prod-slid-btn check-btn" role="button">
                            Proceed to Checkout
                        </a>
                    </div>
                    <div class="check-proc-btn">
					    <a href="/product/products.aspx" class="btn btn-primary prod-slid-btn check-btn" role="button">Continue Shopping</a>
                    </div>
				</div>
			</div>
		</div>
	</section>
    <!-- Relate Product -->
	<%--<section class="product-slider">
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
	</section>--%>
    <script type="text/javascript">
        //$('.owl-carousel').owlCarousel({
        //    margin: 20,
        //    loop: true,
        //    nav: true,
        //    navText: ['<i class="fa fa-angle-left" style="font-size:48px;"></i>', '<i class="fa fa-angle-right" style="font-size:48px;"></i>'],
        //    responsive: {
        //        0: {
        //            items: 1
        //        },
        //        100: {
        //            items: 2
        //        },
        //        600: {
        //            items: 3
        //        },
        //        1000: {
        //            items: 5
        //        }
        //    }
        //});

	$(document).ready(function () {
	    //swal({title : "sagar pawar hello", text : "sagar text", icon:"success", toast:true});
	    //swal({ text: "sagar pawar hello", toast: false });
	    getCartDetails();
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
	                $("#myCartItemsCount").html(cIDetails.length + " Items");
	                $("#spanSubTotal").html(JSON.parse(parsedData.cISubTotal));
	                $("#spanShippingCharges").html(JSON.parse(parsedData.cIShippingCharges));
	                $("#spanTotalAmount").html(JSON.parse(parsedData.cITotaAmount));
	                var divHtml = "";
	                $("#cartDetails").empty();
	                if (cIDetails != null && cIDetails != undefined) {
	                    $.each(cIDetails, function (key, cIDetails) {
	                        clickFunction = "UpdateCart(" + cIDetails.cProductID + ", "+ JSON.stringify("subtract") +");";
	                        divHtml = "<div class='cart-list-sec'><div class='cart-prod-dtl'>" +
                                        "<div class='cart-prod-dtl-img'><a href='#'><img src='/productimages/" + cIDetails.cProductImage + "' class='cart-img-product'></a></div>" +
                                        "<div class='cart-prod-dtl-nm'>" +
                                        "<a href='#'><span>" + cIDetails.cProductName + "</span></a></div>" +
                                        "<div class='cart-prod-qty'>" +
                                        "<div class='flex-w bo5 of-hidden w-size17'>" +
                                        "<button type='button' onclick='UpdateCart(" + cIDetails.cProductID + ", " + JSON.stringify("subtract") + ");' class='btn-num-product-down color1 flex-c-m size7 bg8 eff2'><i class='fs-12 fa fa-minus' aria-hidden='true'></i></button>" +
                                        "<input class='size8 m-text18 t-center num-product' readonly='readonly' type='number' name='num-product1' value='" + cIDetails.cProdQuantity + "'>" +
                                        "<button type='button' onclick='UpdateCart(" + cIDetails.cProductID + ", " + JSON.stringify("add") + ");' class='btn-num-product-up color1 flex-c-m size7 bg8 eff2'>" +
                                        "<i class='fs-12 fa fa-plus' aria-hidden='true'></i></button></div></div>" +
                                        "<div class='cart-prod-price'>&#8377;" + (cIDetails.cProductPrice) + "</div></div>" +
                                        "<div class='cart-prod-remove'><button class='btn btn-primary prod-slid-btn' type='button' onclick='DeleteCartItem(" + cIDetails.cCIID + ", " + cIDetails.cCID + ");'>Remove from cart</button></div></div>";
	                        $("#cartDetails").append(divHtml);
	                    });//cIDetails Ends      
	                }//if CIDetails ends	                
	            }
	        },
	        failure: function (response) {
	            alert(response.d);
	        }
	    });
	};//getcartdetails ends

	function UpdateCart(productID, addOrsubtract) {
	    var dataValue = "{ productID: '" + productID + "', addOrsubtract : '" + addOrsubtract + "' }";
	    $.ajax({
	        type: "POST",
	        url: "../../cart/cart.aspx/updateCart",
	        contentType: "application/json; charset=utf-8",
	        data: dataValue,
	        dataType: "json",
	        success: function (response) {
	            if (response != "" && response.d.Data != 'undefined') {
	                var parsedData = JSON.parse(response.d.Data);
	                if (parsedData && parsedData.UpdateSuccess != undefined && parsedData.UpdateSuccess != null)
	                {
	                    var UpdateSuccess = JSON.parse(parsedData.UpdateSuccess);
	                    if (UpdateSuccess != "") {
	                        swal({ text: UpdateSuccess });
	                    }
	                    else {
	                        getCartDetails();
	                    }
	                }	                
	            }
	        },
	        failure: function (response) {
	            alert(response.d);
	        }
	    }); //update cart  ajax ends
	};//fn updatecart

	function DeleteCartItem(cartItem, cartID) {
	    var dataValue = "{ cartItem: '" + cartItem + "'}";
	    $.ajax({
	        type: "POST",
	        url: "../../cart/cart.aspx/deleteCartItem",
	        contentType: "application/json; charset=utf-8",
	        data: dataValue,
	        dataType: "json",
	        success: function (response) {
	            if (response != "" && response.d.Data != 'undefined') {
	                var parsedData = JSON.parse(response.d.Data);
	                var deleteSuccess = JSON.parse(parsedData.DeleteSuccess);
	                if (deleteSuccess != "") {
	                    swal({ text: deleteSuccess });
	                }
	                else {
	                    getCartDetails();
	                    FetchItemCount();
	                }
	            }
	        },
	        failure: function (response) {
	            alert(response.d);
	        }
	    }); //update cart  ajax ends
	};//fn updatecart
	</script>

</asp:Content>
