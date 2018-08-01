<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ArtCrestApplication.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!--Master Slider Section-->
	<section class="p-t-45">
		<div id="demo" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
				<li data-target="#demo" data-slide-to="3"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="images/master-slide-01.jpg" alt="ms1">
				</div>
				<div class="carousel-item">
					<img src="images/master-slide-02.jpg" alt="ms2">
				</div>
				<div class="carousel-item">
					<img src="images/master-slide-03.jpg" alt="ms3">
				</div>
				<div class="carousel-item">
					<img src="images/master-slide-04.jpg" alt="ms4">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a>
			<a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</section>
    
    <!--Product Slider 1-->
	<section class="product-slider">
		<div class="container mt-4">
			<div class="row">
				<div class="col-md-12 text-center">
					<span class="product-slider-title">Exclusive Rakhi Collection</span>
				</div>
			</div>
		</div>
		
		<div class="container mt-3">
			<div class="row">
				<div class="owl-carousel owl-theme">
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 1</h3>
								<h5 class="prod-slid-prc"><span class="prod_disc_prc">&#8377;&nbsp;135&nbsp;&nbsp;</span>
                                    <span class="prod_sale_prc">&#8377;&nbsp;149</span>
                                    <span class="prod_disc_percent">&nbsp;&nbsp;10% off</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 2</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">40</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 3</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">120</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 4</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">60</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 5</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">84</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 6</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">40</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 7</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">74</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 8</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">49</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 9</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">149</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
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
	
	<!--Product Slider 2-->
	<section class="product-slider">
		<div class="container mt-4">
			<div class="row">
				<div class="col-md-12 text-center">
					<span class="product-slider-title">Children Special Rakhi</span>
				</div>
			</div>
		</div>
		
		<div class="container mt-3">
			<div class="row">
				<div class="owl-carousel owl-theme">
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 1</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">149</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 2</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">40</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 3</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">120</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 4</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">60</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 5</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">84</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 6</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">40</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 7</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">74</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 8</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">49</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Rakhi 9</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">149</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
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
	
	<!--Product Slider 3-->
	<section class="product-slider">
		<div class="container mt-4">
			<div class="row">
				<div class="col-md-12 text-center">
					<span class="product-slider-title">Enlighten your Diwali like never before</span>
				</div>
			</div>
		</div>
		
		<div class="container mt-3">
			<div class="row">
				<div class="owl-carousel owl-theme">
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Diya 1</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">149</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Diya 2</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">40</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Diya 3</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">120</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Diya 4</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">60</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Diya 5</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">84</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Diya 6</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">40</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Diya 7</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">74</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Diya 8</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">49</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Diya 9</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">149</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Diya 10</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">40</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</section>
	
	<!--Product Slider 4-->
	<section class="product-slider">
		<div class="container mt-4">
			<div class="row">
				<div class="col-md-12 text-center">
					<span class="product-slider-title">Pooja thal and Goddess Lakshmi Statue</span>
				</div>
			</div>
		</div>
		
		<div class="container mt-3">
			<div class="row">
				<div class="owl-carousel owl-theme">
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Pooja Thal 1</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">449</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Pooja Thal 2</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">349</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Pooja Thal 3</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">399</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Pooja Thal 4</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">499</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Pooja Thal 5</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">299</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Goddess Lakshmi Statue 1</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">249</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Goddess Lakshmi Statue 2</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">349</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Goddess Lakshmi Statue 3</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">289</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Goddess Lakshmi Statue 4</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">479</span></h5> 
								<button class="btn btn-primary prod-slid-btn" >Add to Cart</button>
							</div>
						</div>
					</div>
					
					<div class="item">
						<div class="card">
							<img src="images/item-01.jpg" alt="img" class="card-img-top">
							<div class="card-body">
								<h3 class="prod-slid-nm">Goddess Lakshmi Statue 5</h3>
								<h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">199</span></h5> 
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
