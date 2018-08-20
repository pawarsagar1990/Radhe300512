<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="productdetail.aspx.cs" Inherits="ArtCrestApplicationWeb.product.productdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/css/productdetail.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container">
        <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
        <asp:HiddenField ID="hdnProductID" runat="server" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnUserID" ClientIDMode="Static" />
    </div>

    <section class="product-detail-section">
         <!-- breadcrumb -->
        <div class="bread-crumb bgwhite flex-w p-l-52 p-r-15 p-t-30 p-l-15-sm">
            <a href="index.html" class="s-text16">Products
			    <i class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
            </a>

            <a href="product.html" class="s-text16"><span id="productSuperCategory"></span>
			    <i class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
            </a>

            <a href="#" class="s-text16"><span id="productCategory"></span>
			    <i class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
            </a>

            <a href="#" class="s-text16"><span id="productSubCategory"></span>
			    <i class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
            </a>

            <span class="s-text17" id="productNameHead"></span>
        </div>


        <div class="container p-t-15 p-b-40">
            <div class="product-image-block">
                <div class="product-image-preview">
                    <div class="product-image-small">
                        <img src="" id="productImage1" alt="ProductImage" style="width:100%" onclick="myFunction(this);">
                    </div>
                    <div class="product-image-small">
                        <img src="" id="productImage2" alt="ProductImage" style="width:100%" onclick="myFunction(this);">
                    </div>
                    <div class="product-image-small">
                        <img src="" id="productImage3" alt="ProductImage" style="width:100%" onclick="myFunction(this);">
                    </div>
                </div>

                <div class="product-image">
                    <img id="expandedImg" src="" style="width:100%;">
                </div>

            </div>

            <div class="product-detail-block p-t-15">
                <h4 class="product-detail-name m-text16 p-b-13" id="productName">
                </h4>
                <span class="s-text12">
                    <span class="prod_disc_prc" id="productDiscountPrice"></span>
                    <span class="prod_sale_prc" id="productSalePrice"></span>
                    <span class="prod_disc_percent" id="productDiscountPercent"></span>
                </span>
                <p style="text-align: justify;" id="productInfo">
                </p>

                <div class="stars">
                    <form>
                        <label class="star-filled"></label>
                        <label class="star-filled"></label>
                        <label class="star-filled"></label>
                        <label class="star-filled"></label>
                        <label class="star-empty"></label>
                    </form>
                </div>

                <div class="p-t-33 p-b-60">


                    <!--<div class="flex-r-m flex-w p-t-10">
                        <div class="w-size16 flex-m flex-w">
                            <!--<div class="flex-w bo5 of-hidden m-r-22 m-t-10 m-b-10">
                                <button class="btn-num-product-down color1 flex-c-m size7 bg8 eff2">
                                    <i class="fs-12 fa fa-minus" aria-hidden="true"></i>
                                </button>

                                <input class="size8 m-text18 t-center num-product" type="number" name="num-product" value="1">

                                <button class="btn-num-product-up color1 flex-c-m size7 bg8 eff2">
                                    <i class="fs-12 fa fa-plus" aria-hidden="true"></i>
                                </button>
                            </div>-->

                            <div class="btn-addcart-product-detail size9 trans-0-4 m-t-10 m-b-10" id="addCartBtn">
                                <!-- Button -->
                                <!--<button class="flex-c-m sizefull prod-slid-btn bo-rad-23 s-text1 trans-0-4" onclick="AddToCart()" type="button">
                                    Add to Cart
                                </button>-->
                            </div>
                        <!--</div>
                    </div>-->
                </div>



                <!--  -->
                <div class="wrap-dropdown-content bo6 p-t-15 p-b-14 active-dropdown-content">
                    <h5 class="js-toggle-dropdown-content flex-sb-m cs-pointer m-text19 color0-hov trans-0-4">Description
						<i class="down-mark fs-12 color1 fa fa-minus dis-none" aria-hidden="true"></i>
                        <i class="up-mark fs-12 color1 fa fa-plus" aria-hidden="true"></i>
                    </h5>

                    <div class="dropdown-content dis-none p-t-15 p-b-23">
                        <p style="text-align: justify;" id="productDesc">
                        </p>
                    </div>
                </div>

                <div class="wrap-dropdown-content bo7 p-t-15 p-b-14">
                    <h5 class="js-toggle-dropdown-content flex-sb-m cs-pointer m-text19 color0-hov trans-0-4">Additional information
						<i class="down-mark fs-12 color1 fa fa-minus dis-none" aria-hidden="true"></i>
                        <i class="up-mark fs-12 color1 fa fa-plus" aria-hidden="true"></i>
                    </h5>

                    <div class="dropdown-content dis-none p-t-15 p-b-23">
                        <p style="text-align: justify;" id="productAddInfo">
                        </p>
                    </div>
                </div>

                <div class="wrap-dropdown-content bo7 p-t-15 p-b-14">
                    <h5 class="js-toggle-dropdown-content flex-sb-m cs-pointer m-text19 color0-hov trans-0-4">Reviews (1)
						<i class="down-mark fs-12 color1 fa fa-minus dis-none" aria-hidden="true"></i>
                        <i class="up-mark fs-12 color1 fa fa-plus" aria-hidden="true"></i>
                    </h5>

                    <div class="dropdown-content dis-none p-t-15 p-b-23">
                        <span>Sagar Pawar</span>
                        <p style="text-align: justify;">
                            Very nice product. We liked it a lot. Delivery was also quick enough. 
                        </p>
                    </div>
                </div>

            </div>
        </div>

    </section>

    <!-- Relate Product -->
    <div id="relatedProduct">
    <!--
    <section class="product-slider">
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-12 text-center">
                    <span class="product-slider-title">Related Products</span>
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
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="/images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">A set of 12 diyas decorated and designed in red colour</h3>
                                <h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">40</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="/images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Diya 3</h3>
                                <h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">120</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="/images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">SaptDiya 4</h3>
                                <h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">60</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="/images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Diya 5</h3>
                                <h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">84</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="/images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Diya 6</h3>
                                <h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">40</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="/images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Rakhi 7</h3>
                                <h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">74</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="/images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Rakhi 8</h3>
                                <h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">49</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="/images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Rakhi 9</h3>
                                <h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">149</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="/images/item-01.jpg" alt="img" class="card-img-top">
                            <div class="card-body">
                                <h3 class="prod-slid-nm">Rakhi 10</h3>
                                <h5 class="prod-slid-prc">&#8377;&nbsp;<span class="text-center">40</span></h5>
                                <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
        -->
    </div>
    <script>

        $(document).ready(function () {
            var dataValue = "{ productID: '" + $("#hdnProductID").val() + "' }";
            $.ajax({
                type: "POST",
                url: "../../product/productdetail.aspx/getProductDetailList",
                contentType: "application/json; charset=utf-8",
                data: dataValue,
                dataType: "json",
                success: function (response) {
                    if (response != "" && response.d.Data != 'undefined') {
                        var parsedData = JSON.parse(response.d.Data);
                        var ProductData = JSON.parse(parsedData.ProductDetailList);
                        $("#productSuperCategory").html(ProductData[0].pSuperCategoryName);
                        $("#productCategory").html(ProductData[0].pCategoryName);
                        $("#productSubCategory").html(ProductData[0].pSubCategoryName);
                        $("#productNameHead").html(ProductData[0].pPName);
                        $("#productName").html(ProductData[0].pPName);
                        $("#expandedImg").attr("src", "/productimages/" + ProductData[0].pImageLink1 + "");
                        $("#productImage1").attr("src", "/productimages/" + ProductData[0].pImageLink1 + "");
                        $("#productImage2").attr("src", "/productimages/" + ProductData[0].pImageLink2 + "");
                        $("#productImage3").attr("src", "/productimages/" + ProductData[0].pImageLink3 + "");
                        if (ProductData[0].pPDiscountPercent > 0) {
                            $("#productDiscountPrice").html("&#8377;" + ProductData[0].pPDiscountPrice + "&nbsp;");
                            $("#productSalePrice").html("&#8377;" + ProductData[0].pPSellPrice + "&nbsp;");
                            $("#productDiscountPercent").html(ProductData[0].pPDiscountPercent + "% OFF");
                        }
                        else {
                            $("#productDiscountPrice").html("&#8377;&nbsp;" + ProductData[0].pPDiscountPrice + "&nbsp;");
                        }
                        $("#productInfo").html(ProductData[0].pPDesc);
                        $("#productDesc").html(ProductData[0].pPDesc);
                        $("#productAddInfo").html(ProductData[0].pPFeatures);
                        var clickCartFunction = "";
                        if (parseInt($("#hdnUserID").val()) > 0 && parseInt(ProductData[0].pPQuantity) > 0) {
                            clickCartFunction = "AddToCart();"
                        }
                        else if (parseInt($("#hdnUserID").val()) > 0 && parseInt(ProductData[0].pPQuantity) == 0) {
                            clickCartFunction = "outOfStock();";
                        }
                        else {
                            clickCartFunction = "RedirectToLogin();";
                        }
                        var addcartbtndiv = "";
                        var inStock = "";
                        if (parseInt(ProductData[0].pPQuantity) > 0) {
                            inStock = "<span style='color:green;display:inline-block;padding:10px;'>In Stock<span>";
                        }
                        else {
                            inStock = "<span style='color:red;display:inline-block;padding:10px;'>Out of Stock<span>";
                        }
                        addcartbtndiv = "<button class='flex-c-m sizefull prod-slid-btn bo-rad-23 s-text1 trans-0-4' onclick='" + clickCartFunction + "' type='button'>Add to Cart</button>" + inStock;
                        $("#addCartBtn").append(addcartbtndiv);
                       
                     }

                        },
                            failure: function (response) {
                    alert(response.d);
                        }
            }); //Product detail ends 


            //Related Product Ajax Call
           $.ajax({
                type: "POST",
                url: "../../product/productdetail.aspx/getRelatedProductList",
                contentType: "application/json; charset=utf-8",
                data: dataValue,
                dataType: "json",
                success: function (response) {
                    if (response != "" && response.d.Data != 'undefined') {
                        var parsedData = JSON.parse(response.d.Data);
                        var ProductList = JSON.parse(parsedData.RelatedProductList);
                        var divHtml = "";
                        divHtml = "<section class='product-slider'><div class='container mt-4'>" +
                                       "<div class='row'>" +
                                       "<div class='col-md-12 text-center'><span class='product-slider-title'>Related Products</span></div>" +
                                       "</div></div>" +
                                       "<div class='container mt-3'>" +
                                       "<div class='row'>" +
                                       "<div class='owl-carousel owl-theme'>";
                        var eachProductItemDiv = "";
                        $.each(ProductList, function (key, ProductList) {
                            
                                var clickFunction = "";
                                if (parseInt($("#hdnUserID").val()) > 0) {
                                    clickFunction = "AddToCartRelated(" + ProductList.pPID + ");"
                                }
                                else {
                                    clickFunction = "RedirectToLogin();";
                                }
                                eachProductItemDiv = eachProductItemDiv + "<div class='item'>" +
                                           "<div class='card'>" +
                                           "<a target='_blank' href='/product/productdetail.aspx?pid=" + ProductList.pPID+ "'><img src='/productimages/" + ProductList.pImageLink + "' alt='img' class='card-img-top'></a>" +
                                           "<div class='card-body'>" +
                                           "<h3 class='prod-slid-nm'><a target='_blank' href='/product/productdetail.aspx?pid=" + ProductList.pPID + "'>" + ProductList.pPName + "</a></h3>";
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
                            //subcat if loop ends     
                        });
                        divHtml = divHtml + eachProductItemDiv + "</div></div></div></section>";
                        $("#relatedProduct").append(divHtml);

                        /*Related products Owl Carousel*/
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
                                    items: 3
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
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
            //Related Product Ends

        }); //Document Ready Ends

        // Add to Cart for current product
        function AddToCart() {
            var dataValue = "{ productID: '" + $("#hdnProductID").val() + "', userID : '" + $("#hdnUserID").val() + "' }";
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
            }); //Add to Cart for current product ends
        };

        //Add to Cart for Related product
        function AddToCartRelated(productID) {
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
            }); //Add to Cart for related product ends
        };

        function RedirectToLogin() {
            window.location.href = "../login.aspx";
        }

        function outOfStock() {
            swal({
                title: "Sorry! This product is currently out of stock.",
                cancelButtonColor: "#DD6B55",
                confirmButtonColor: "#DD6B55",
                showLoaderOnConfirm: true,
                buttons: {
                    ok: {
                        text: "Ok",
                        value: false,
                        visible: true,
                        className: "",
                        dangerMode: true,
                        closeModal: true
                    }
                },
                dangerMode: false,
            })
        }

        /* Product Review click function*/
        function myFunction(imgs)
        {
            var expandImg = document.getElementById("expandedImg");
            expandImg.src = imgs.src;
            expandImg.parentElement.style.display = "inline-block";
            document.getElementById("productImageDefault").style("display:none;");
        }


        

    </script>
</asp:Content>
