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

    <div id="ProductSlider">
        <!--Product Slider 1-->
        <%--<section class="product-slider">
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
                                <h5 class="prod-slid-prc"><span class="prod_disc_prc">&#8377;135&nbsp;</span>
                                    <span class="prod_sale_prc">&#8377;149</span>
                                    <span class="prod_disc_percent">&nbsp;10% off</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>--%>
    </div>
    <%--    <!--Product Slider 2-->
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
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">149</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Rakhi 2</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">40</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Rakhi 3</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">120</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Rakhi 4</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">60</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Rakhi 5</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">84</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Rakhi 6</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">40</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Rakhi 7</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">74</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Rakhi 8</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">49</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Rakhi 9</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">149</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Rakhi 10</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">40</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
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
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">149</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Diya 2</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">40</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Diya 3</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">120</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Diya 4</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">60</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Diya 5</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">84</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Diya 6</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">40</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Diya 7</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">74</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Diya 8</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">49</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Diya 9</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">149</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Diya 10</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">40</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
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
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">449</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Pooja Thal 2</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">349</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Pooja Thal 3</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">399</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Pooja Thal 4</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">499</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Pooja Thal 5</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">299</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Goddess Lakshmi Statue 1</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">249</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Goddess Lakshmi Statue 2</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">349</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Goddess Lakshmi Statue 3</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">289</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Goddess Lakshmi Statue 4</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">479</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Goddess Lakshmi Statue 5</h3>
                                <h5 class="prod-slid-prc">&#8377;<span class="text-center">199</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>--%>

    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                url: "../../Home.aspx/getProductList",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response != "" && response.d.Data != 'undefined') {
                        var parsedData = JSON.parse(response.d.Data);
                        var ProductSubCatList = JSON.parse(parsedData.ProductSubCatList);
                        var ProductList = JSON.parse(parsedData.ProductList);
                        var divHtml = "";
                        if (ProductSubCatList != null && ProductSubCatList != undefined) {
                            $.each(ProductSubCatList, function (key, ProductSubCatList) {
                                divHtml = "<section class='product-slider'><div class='container mt-4'>" +
                                       "<div class='row'>" +
                                       "<div class='col-md-12 text-center'><span class='product-slider-title'>" + ProductSubCatList.pSName + "</span></div>" +
                                       "</div></div>" +
                                       "<div class='container mt-3'>" +
                                       "<div class='row'>" +
                                       "<div class='owl-carousel owl-theme'>";
                                var eachProductItemDiv = "";
                                $.each(ProductList, function (key, ProductList) {
                                    if (ProductList.pProdSubCategoryID == ProductSubCatList.pSID) {
                                        var clickFunction = "";
                                        if (parseInt($("#hdnUserID").val()) > 0) {
                                            clickFunction = "AddToCart(" + ProductList.pPID + ");"
                                        }
                                        else {
                                            clickFunction = "RedirectToLogin();";
                                        }
                                        eachProductItemDiv = eachProductItemDiv + "<div class='item'>" +
                                                   "<div class='card'>" +
                                                   "<img src='productimages/" + ProductList.pImageLink + "' alt='img' class='card-img-top'>" +
                                                   "<div class='card-body'>" +
                                                   "<h3 class='prod-slid-nm'>" + ProductList.pPName + "</h3>";
                                        if (ProductList.pPDiscountPercent > 0) {
                                            eachProductItemDiv = eachProductItemDiv + "<h5 class='prod-slid-prc'>" + "<span class='prod_disc_prc'>&#8377;" + ProductList.pPDiscountPrice + "&nbsp;</span>" + "<span class='prod_sale_prc'>&#8377;" + ProductList.pPSellPrice + "</span>" +
                                                   "<span class='prod_disc_percent'>&nbsp;" + ProductList.pPDiscountPercent + "% OFF</span></h5>";
                                        }
                                        else {
                                            eachProductItemDiv = eachProductItemDiv + "<h5 class='prod-slid-prc'>" +
                                                   "<span class='prod_disc_prc'>&#8377;" + ProductList.pPDiscountPrice + "&nbsp;</span></h5>";
                                        }
                                        eachProductItemDiv = eachProductItemDiv + "<button class='btn btn-primary prod-slid-btn' type='button' onclick='" + clickFunction + "'>Add to Cart</button>" +
                                                   "</div></div></div>";
                                    }//subcat if loop ends     
                                });
                                divHtml = divHtml + eachProductItemDiv + "</div></div></div></section>";
                                $("#ProductSlider").append(divHtml);
                            });

                            $('.owl-carousel').owlCarousel({
                                margin: 20,
                                loop: false,
                                nav: true,
                                navText: ['<i class="fa fa-angle-left" style="font-size:48px;"></i>', '<i class="fa fa-angle-right" style="font-size:48px;"></i>'],
                                responsive: {
                                    0: {
                                        items: 1
                                    },
                                    500: {
                                        items: 2
                                    },
                                    800: {
                                        items:3
                                    },
                                    1000: {
                                        items: 4
                                    },
                                    1500: {
                                        items: 5
                                    }
                                }
                            });
                        }
                    }
                    //var divHtml = "<section class='product-slider'><div class='container mt-4'>" +
                    //                "<div class='row'>" +
                    //                "<div class='col-md-12 text-center'><span class='product-slider-title'>Exclusive Rakhi Collection</span></div>" +
                    //                "</div></div>" +
                    //                "<div class='container mt-3'>" +
                    //                "<div class='row'>" +
                    //                "<div class='owl-carousel owl-theme'>" +
                    //                ///each product
                    //                "<div class='item'>" +
                    //                "<div class='card'>" +
                    //                "<img src='images/item-01.jpg' alt='img' class='card-img-top'>" +
                    //                "<div class='card-body'>" +
                    //                "<h3 class='prod-slid-nm'>Rakhi 1</h3>" +
                    //                "<h5 class='prod-slid-prc'>" +
                    //                "<span class='prod_disc_prc'>&#8377;135&nbsp;</span>" +
                    //                "<span class='prod_sale_prc'>&#8377;149</span>" +
                    //                "<span class='prod_disc_percent'>&nbsp;10% off</span></h5>" +
                    //                "<button class='btn btn-primary prod-slid-btn'>Add to Cart</button>" +
                    //                "</div></div></div>" +
                    //                ///product div ends.
                    //                "</div></div></div>" +
                    //                "</section>";
                },
                failure: function (response) {
                    alert(response.d);
                }
            }); //Product ends            
        });

        function AddToCart(productID) {
            var dataValue = "{ productID: '" + productID + "', userID : '" + $("#hdnUserID").val() + "' }";
            $.ajax({
                type: "POST",
                url: "../../Home.aspx/addToCart",
                contentType: "application/json; charset=utf-8",
                data: dataValue,
                dataType: "json",
                success: function (response) {
                    if (response != "" && response.d.Data != 'undefined') {
                        var parsedData = JSON.parse(response.d.Data);
                        var CartItemCount = JSON.parse(parsedData.CartItemCount);
                        if (CartItemCount != null && CartItemCount != undefined && CartItemCount != "") {
                            $("#cartItemCount").html(CartItemCount);
                        }
                    }
                },
                failure: function (response) {
                    alert(response.d);
                }
            }); //Add to Cart ends
        };

        function RedirectToLogin() {
            window.location.href = "login.aspx";
        }
    </script>
    <asp:HiddenField runat="server" ID="hdnUserID" ClientIDMode="Static" />
</asp:Content>
