<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="ArtCrestApplicationWeb.product.products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="container">
        <asp:Label ID="lblErrorMsg" runat="server" ClientIDMode="Static"></asp:Label>
        <asp:HiddenField ID="hdnSubCatID" runat="server" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnSearchAlias" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdnUserID" ClientIDMode="Static" />
    </div>

    <!-- Title Page -->
	<section class="bg-title-page p-t-50 p-b-40 flex-col-c-m m-t-10" style="background-image: url(/images/heading-pages-02.jpg);">
		<h2 class="l-text2 t-center">
			Products
		</h2>
		<p class="m-text13 t-center">
			Checkout the exclusive collection at Skartif
		</p>
	</section>

    <section class="bgwhite p-t-55 p-b-65">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
                    <div class="leftbar p-r-20 p-r-0-sm" id="catList">
                        <!--  
                        <h4 class="m-text14 p-b-7">Categories
                        </h4>

                        <ul class="p-b-54">
                            <li class="p-t-4">
                                <a href="#" class="s-text13 active1">All
                                </a>
                            </li>

                            <li class="p-t-4">
                                <a href="#" class="s-text13">Kids Rakhi
                                </a>
                            </li>

                            <li class="p-t-4">
                                <a href="#" class="s-text13">Joda Rakhi
                                </a>
                            </li>

                            <li class="p-t-4">
                                <a href="#" class="s-text13">Single Rakhi
                                </a>
                            </li>

                            <li class="p-t-4">
                                <a href="#" class="s-text13">Designer Rakhi
                                </a>
                            </li>

                            <li class="p-t-4">
                                <a href="#" class="s-text13">Puppet Rakhi
                                </a>
                            </li>
                            <li class="p-t-4">
                                <a href="#" class="s-text13">Ladies Rakhi
                                </a>
                            </li>
                        </ul>
                            -->
                    </div>
                </div>

                <div class="col-sm-6 col-md-8 col-lg-9 p-b-50" id="productDataList">
                    <!--<div class="row">
                        <div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
                            <div class="block2 ">
                                <div class="block2-img card">
                                    <img src="/productimages/Chhota Bhim Rakhi 1_4_0.jpeg" class="card-img-top" style="width: 100%;" alt="IMG-PRODUCT">
                                </div>

                                <div class="card-body">
                                    <h3 class="prod-slid-nm">Rakhi 1</h3>
                                    <h5 class="prod-slid-prc"><span class="prod_disc_prc">&#8377;135&nbsp;</span>
                                        <span class="prod_sale_prc">&#8377;149</span>
                                        <span class="prod_disc_percent">&nbsp;10% off</span></h5>
                                    <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                                </div>

                            </div>
                        </div>

                        <div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
                            <div class="block2 ">
                                <div class="block2-img card">
                                    <img src="/productimages/item-01.jpg" class="card-img-top" style="width: 100%;" alt="IMG-PRODUCT">
                                </div>

                                <div class="card-body">
                                    <h3 class="prod-slid-nm">Rakhi 1</h3>
                                    <h5 class="prod-slid-prc"><span class="prod_disc_prc">&#8377;135&nbsp;</span>
                                        <span class="prod_sale_prc">&#8377;149</span>
                                        <span class="prod_disc_percent">&nbsp;10% off</span></h5>
                                    <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                                </div>

                            </div>
                        </div>

                        <div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
                            <div class="block2 ">
                                <div class="block2-img card">
                                    <img src="/productimages/item-01.jpg" class="card-img-top" style="width: 100%;" alt="IMG-PRODUCT">
                                </div>

                                <div class="card-body">
                                    <h3 class="prod-slid-nm">Rakhi 1</h3>
                                    <h5 class="prod-slid-prc"><span class="prod_disc_prc">&#8377;135&nbsp;</span>
                                        <span class="prod_sale_prc">&#8377;149</span>
                                        <span class="prod_disc_percent">&nbsp;10% off</span></h5>
                                    <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                                </div>

                            </div>
                        </div>

                        <div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
                            <div class="block2 ">
                                <div class="block2-img card">
                                    <img src="/productimages/item-01.jpg" class="card-img-top" style="width: 100%;" alt="IMG-PRODUCT">
                                </div>

                                <div class="card-body">
                                    <h3 class="prod-slid-nm">Rakhi 1</h3>
                                    <h5 class="prod-slid-prc"><span class="prod_disc_prc">&#8377;135&nbsp;</span>
                                        <span class="prod_sale_prc">&#8377;149</span>
                                        <span class="prod_disc_percent">&nbsp;10% off</span></h5>
                                    <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                                </div>

                            </div>
                        </div>

                        <div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
                            <div class="block2 ">
                                <div class="block2-img card">
                                    <img src="/productimages/item-01.jpg" class="card-img-top" style="width: 100%;" alt="IMG-PRODUCT">
                                </div>

                                <div class="card-body">
                                    <h3 class="prod-slid-nm">Rakhi 1</h3>
                                    <h5 class="prod-slid-prc"><span class="prod_disc_prc">&#8377;135&nbsp;</span>
                                        <span class="prod_sale_prc">&#8377;149</span>
                                        <span class="prod_disc_percent">&nbsp;10% off</span></h5>
                                    <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                                </div>

                            </div>
                        </div>

                        <div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
                            <div class="block2 ">
                                <div class="block2-img card">
                                    <img src="/productimages/item-01.jpg" class="card-img-top" style="width: 100%;" alt="IMG-PRODUCT">
                                </div>

                                <div class="card-body">
                                    <h3 class="prod-slid-nm">Rakhi 1</h3>
                                    <h5 class="prod-slid-prc"><span class="prod_disc_prc">&#8377;135&nbsp;</span>
                                        <span class="prod_sale_prc">&#8377;149</span>
                                        <span class="prod_disc_percent">&nbsp;10% off</span></h5>
                                    <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                                </div>

                            </div>
                        </div>

                        <div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
                            <div class="block2 ">
                                <div class="block2-img card">
                                    <img src="/productimages/item-01.jpg" class="card-img-top" style="width: 100%;" alt="IMG-PRODUCT">
                                </div>

                                <div class="card-body">
                                    <h3 class="prod-slid-nm">Rakhi 1</h3>
                                    <h5 class="prod-slid-prc"><span class="prod_disc_prc">&#8377;135&nbsp;</span>
                                        <span class="prod_sale_prc">&#8377;149</span>
                                        <span class="prod_disc_percent">&nbsp;10% off</span></h5>
                                    <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                                </div>

                            </div>
                        </div>

                        <div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
                            <div class="block2 ">
                                <div class="block2-img card">
                                    <img src="/productimages/item-01.jpg" class="card-img-top" style="width: 100%;" alt="IMG-PRODUCT">
                                </div>

                                <div class="card-body">
                                    <h3 class="prod-slid-nm">Rakhi 1</h3>
                                    <h5 class="prod-slid-prc"><span class="prod_disc_prc">&#8377;135&nbsp;</span>
                                        <span class="prod_sale_prc">&#8377;149</span>
                                        <span class="prod_disc_percent">&nbsp;10% off</span></h5>
                                    <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                                </div>

                            </div>
                        </div>

                        <div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
                            <div class="block2 ">
                                <div class="block2-img card">
                                    <img src="/productimages/item-01.jpg" class="card-img-top" style="width: 100%;" alt="IMG-PRODUCT">
                                </div>

                                <div class="card-body">
                                    <h3 class="prod-slid-nm">Rakhi 1</h3>
                                    <h5 class="prod-slid-prc"><span class="prod_disc_prc">&#8377;135&nbsp;</span>
                                        <span class="prod_sale_prc">&#8377;149</span>
                                        <span class="prod_disc_percent">&nbsp;10% off</span></h5>
                                    <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                                </div>

                            </div>
                        </div>

                        <div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
                            <div class="block2 ">
                                <div class="block2-img card">
                                    <img src="/productimages/item-01.jpg" class="card-img-top" style="width: 100%;" alt="IMG-PRODUCT">
                                </div>

                                <div class="card-body">
                                    <h3 class="prod-slid-nm">Rakhi 1</h3>
                                    <h5 class="prod-slid-prc"><span class="prod_disc_prc">&#8377;135&nbsp;</span>
                                        <span class="prod_sale_prc">&#8377;149</span>
                                        <span class="prod_disc_percent">&nbsp;10% off</span></h5>
                                    <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                                </div>

                            </div>
                        </div>

                        <div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
                            <div class="block2 ">
                                <div class="block2-img card">
                                    <img src="/productimages/item-01.jpg" class="card-img-top" style="width: 100%;" alt="IMG-PRODUCT">
                                </div>

                                <div class="card-body">
                                    <h3 class="prod-slid-nm">Rakhi 1</h3>
                                    <h5 class="prod-slid-prc"><span class="prod_disc_prc">&#8377;135&nbsp;</span>
                                        <span class="prod_sale_prc">&#8377;149</span>
                                        <span class="prod_disc_percent">&nbsp;10% off</span></h5>
                                    <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                                </div>

                            </div>
                        </div>

                        <div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
                            <div class="block2 ">
                                <div class="block2-img card">
                                    <img src="/productimages/item-01.jpg" class="card-img-top" style="width: 100%;" alt="IMG-PRODUCT">
                                </div>

                                <div class="card-body">
                                    <h3 class="prod-slid-nm">Rakhi 1</h3>
                                    <h5 class="prod-slid-prc"><span class="prod_disc_prc">&#8377;135&nbsp;</span>
                                        <span class="prod_sale_prc">&#8377;149</span>
                                        <span class="prod_disc_percent">&nbsp;10% off</span></h5>
                                    <button class="btn btn-primary prod-slid-btn">Add to Cart</button>
                                </div>

                            </div>
                        </div>

                    </div>-->
                </div>
            </div>
        </div>
    </section>


    <script>

        $(document).ready(function () {

            $.ajax({
                type: "POST",
                url: "../../product/products.aspx/getCategoryList",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response != "" && response.d.Data != 'undefined') {
                        var parsedData = JSON.parse(response.d.Data);
                        var ProductCategoryData = JSON.parse(parsedData.ProductCategoryList);

                        var divcathtml = "";
                        divcathtml = "<h4 class='m-text14 p-b-7'>Categories</h4><ul class='p-b-54'><li class='p-t-4'><a href='/product/products.aspx?scid=0' class='s-text13 active1'>All</a></li>";
                        var eachcatname = "";
                        $.each(ProductCategoryData, function (key, ProductCategoryData) {
                            eachcatname = eachcatname + "<li class='p-t-4'><a href='/product/products.aspx?scid=" + ProductCategoryData.pCatID + "' class='s-text13'>" + ProductCategoryData.pCatName + "</a></li>";
                        });
                        divcathtml = divcathtml + eachcatname + "</ul>";
                        $("#catList").append(divcathtml);   
                    }

                },
                failure: function (response) {
                    alert(response.d);
                }
            }); //Product Category List ends 

            if ($("#hdnSearchAlias").val() != "") {
                ajaxCallProdSearch();
            }
            else {
                ajaxCallProdByCat();
            };   

        })
        // Document ready ends



        // Ajax call Product by Category fcuntion start
        function ajaxCallProdByCat() {
            var dataValue = "{ catID: '" + $("#hdnSubCatID").val() + "' }";
            if ($("#hdnSubCatID").val() == "") {
                dataValue = "{ catID: '0' }";
            };
            
            $.ajax({
                type: "POST",
                url: "../../product/products.aspx/getProductList",
                contentType: "application/json; charset=utf-8",
                data: dataValue,
                dataType: "json",
                success: function (response) {
                    if (response != "" && response.d.Data != 'undefined') {
                        var parsedData = JSON.parse(response.d.Data);
                        var ProductData = JSON.parse(parsedData.ProductList);

                        var divprodhtml = "";
                        divprodhtml = "<div class='row'>"
                        var eachProduct = "";
                        $.each(ProductData, function (key, ProductData) {

                            var clickFunction = "";
                            if (parseInt($("#hdnUserID").val()) > 0) {
                                clickFunction = "AddToCartRelated(" + ProductData.pPID + ");"
                            }
                            else {
                                clickFunction = "RedirectToLogin();";
                            }

                            eachProduct = eachProduct + "<div class='col-sm-12 col-md-6 col-lg-4 p-b-50'><div class='block2'><div class='block2-img card'>"
                                    + "<a target='_blank' href='/product/productdetail.aspx?pid=" + ProductData.pPID + "'><img src='/productimages/" + ProductData.pImageLink + "' class='card-img-top' style='width:100%;' alt='IMG-PRODUCT'></a></div>"
                                    + "<div class='card-body'><h3 class='prod-slid-nm'><a target='_blank' href='/product/productdetail.aspx?pid=" + ProductData.pPID + "'>" + ProductData.pPName + "</a></h3>"
                            if (ProductData.pPDiscountPercent > 0) {
                                eachProduct = eachProduct + "<h5 class='prod-slid-prc'>" + "<span class='prod_disc_prc'>&#8377;" + ProductData.pPDiscountPrice + "&nbsp;</span>" + "<span class='prod_sale_prc'>&#8377;" + ProductData.pPSellPrice + "</span>" +
                                       "<span class='prod_disc_percent'>&nbsp;" + ProductData.pPDiscountPercent + "% OFF</span></h5>";
                            }
                            else {
                                eachProduct = eachProduct + "<h5 class='prod-slid-prc'>" +
                                       "<span class='prod_disc_prc'>&#8377;" + ProductData.pPDiscountPrice + "&nbsp;</span></h5>";
                            }
                            eachProduct = eachProduct + "<button class='btn btn-primary prod-slid-btn' type='button' onclick='" + clickFunction + "'>Add to Cart</button></div></div></div>";

                        });
                        divprodhtml = divprodhtml + eachProduct + "</div>";
                        $("#productDataList").append(divprodhtml);
                    }

                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        };
        // Ajax call Product by Category fcuntion ends


        // Search ajax call function starts

        function ajaxCallProdSearch() {
            var dataValue1 = "{ searchAlias: '" + $("#hdnSearchAlias").val() + "' }";
            $.ajax({
                type: "POST",
                url: "../../product/products.aspx/getProductSearchList",
                contentType: "application/json; charset=utf-8",
                data: dataValue1,
                dataType: "json",
                success: function (response) {
                    if (response != "" && response.d.Data != 'undefined') {
                        var parsedData = JSON.parse(response.d.Data);
                        var ProductData = JSON.parse(parsedData.ProductSearchList);
                        if (ProductData != null) {
                            var divprodhtml = "";
                            divprodhtml = "<div class='row'>"
                            var eachProduct = "";
                            $.each(ProductData, function (key, ProductData) {

                                var clickFunction = "";
                                if (parseInt($("#hdnUserID").val()) > 0) {
                                    clickFunction = "AddToCartRelated(" + ProductData.pPID + ");"
                                }
                                else {
                                    clickFunction = "RedirectToLogin();";
                                }

                                eachProduct = eachProduct + "<div class='col-sm-12 col-md-6 col-lg-4 p-b-50'><div class='block2'><div class='block2-img card'>"
                                        + "<a target='_blank' href='/product/productdetail.aspx?pid=" + ProductData.pPID + "'><img src='/productimages/" + ProductData.pImageLink + "' class='card-img-top' style='width:100%;' alt='IMG-PRODUCT'></a></div>"
                                        + "<div class='card-body'><h3 class='prod-slid-nm'><a target='_blank' href='/product/productdetail.aspx?pid=" + ProductData.pPID + "'>" + ProductData.pPName + "</a></h3>"
                                if (ProductData.pPDiscountPercent > 0) {
                                    eachProduct = eachProduct + "<h5 class='prod-slid-prc'>" + "<span class='prod_disc_prc'>&#8377;" + ProductData.pPDiscountPrice + "&nbsp;</span>" + "<span class='prod_sale_prc'>&#8377;" + ProductData.pPSellPrice + "</span>" +
                                           "<span class='prod_disc_percent'>&nbsp;" + ProductData.pPDiscountPercent + "% OFF</span></h5>";
                                }
                                else {
                                    eachProduct = eachProduct + "<h5 class='prod-slid-prc'>" +
                                           "<span class='prod_disc_prc'>&#8377;" + ProductData.pPDiscountPrice + "&nbsp;</span></h5>";
                                }
                                eachProduct = eachProduct + "<button class='btn btn-primary prod-slid-btn' type='button' onclick='" + clickFunction + "'>Add to Cart</button></div></div></div>";

                            });
                            divprodhtml = divprodhtml + eachProduct + "</div>";
                            $("#productDataList").append(divprodhtml);
                        }
                        else {
                            $("#lblErrorMsg").val("You search pattern did not match any product in our inventory. Please try again using suitable words for product you are trying to search.");
                        }
                        
                    }

                    

                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        };

        // Search Ajax call functions ends

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
                            $("#cartItemCountMob").html(CartItemCount);
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

    </script>


</asp:Content>
