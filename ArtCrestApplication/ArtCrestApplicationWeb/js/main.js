
(function ($) {
    "use strict";

    /*[ Load page ]
    ===========================================================*/
    $(".animsition").animsition({
        inClass: 'fade-in',
        outClass: 'fade-out',
        inDuration: 1500,
        outDuration: 800,
        linkElement: '.animsition-link',
        loading: true,
        loadingParentElement: 'html',
        loadingClass: 'animsition-loading-1',
        loadingInner: '<div data-loader="ball-scale"></div>',
        timeout: false,
        timeoutCountdown: 5000,
        onLoadEvent: true,
        browser: [ 'animation-duration', '-webkit-animation-duration'],
        overlay : false,
        overlayClass : 'animsition-overlay-slide',
        overlayParentElement : 'html',
        transition: function(url){ window.location.href = url; }
    });
    
    /*[ Back to top ]
    ===========================================================*/
    var windowH = $(window).height()/2;

    $(window).on('scroll',function(){
        if ($(this).scrollTop() > windowH) {
            $("#myBtn").css('display','flex');
        } else {
            $("#myBtn").css('display','none');
        }
    });

    $('#myBtn').on("click", function(){
        $('html, body').animate({scrollTop: 0}, 300);
    });


    /*[ Show header dropdown ]
    ===========================================================*/
    $('.js-show-header-dropdown').on('click', function(){
        $(this).parent().find('.header-dropdown')
    });

    var menu = $('.js-show-header-dropdown');
    var sub_menu_is_showed = -1;

    for(var i=0; i<menu.length; i++){
        $(menu[i]).on('click', function(){ 
            
                if(jQuery.inArray( this, menu ) == sub_menu_is_showed){
                    $(this).parent().find('.header-dropdown').toggleClass('show-header-dropdown');
                    sub_menu_is_showed = -1;
                }
                else {
                    for (var i = 0; i < menu.length; i++) {
                        $(menu[i]).parent().find('.header-dropdown').removeClass("show-header-dropdown");
                    }

                    $(this).parent().find('.header-dropdown').toggleClass('show-header-dropdown');
                    sub_menu_is_showed = jQuery.inArray( this, menu );
                }
        });
    }

    $(".js-show-header-dropdown, .header-dropdown").click(function(event){
        event.stopPropagation();
    });

    $(window).on("click", function(){
        for (var i = 0; i < menu.length; i++) {
            $(menu[i]).parent().find('.header-dropdown').removeClass("show-header-dropdown");
        }
        sub_menu_is_showed = -1;
    });


     /*[ Fixed Header ]
    ===========================================================*/
    var posWrapHeader = $('.topbar').height();
    var header = $('.container-menu-header');

    $(window).on('scroll',function(){

        if($(this).scrollTop() >= posWrapHeader) {
            $('.header1').addClass('fixed-header');
            $(header).css('top',-posWrapHeader); 

        }  
        else {
            var x = - $(this).scrollTop(); 
            $(header).css('top',x); 
            $('.header1').removeClass('fixed-header');
        } 

        if($(this).scrollTop() >= 200 && $(window).width() > 992) {
            $('.fixed-header2').addClass('show-fixed-header2');
            $('.header2').css('visibility','hidden'); 
            $('.header2').find('.header-dropdown').removeClass("show-header-dropdown");
            
        }  
        else {
            $('.fixed-header2').removeClass('show-fixed-header2');
            $('.header2').css('visibility','visible'); 
            $('.fixed-header2').find('.header-dropdown').removeClass("show-header-dropdown");
        } 

    });
    
    /*[ Show menu mobile ]
    ===========================================================*/
    $('.btn-show-menu-mobile').on('click', function(){
        $(this).toggleClass('is-active');
        $('.wrap-side-menu').slideToggle();
    });

    var arrowMainMenu = $('.arrow-main-menu');

    for(var i=0; i<arrowMainMenu.length; i++){
        $(arrowMainMenu[i]).on('click', function(){
            $(this).parent().find('.sub-menu').slideToggle();
            $(this).toggleClass('turn-arrow');
        })
    }

    $(window).resize(function(){
        if($(window).width() >= 992){
            if($('.wrap-side-menu').css('display') == 'block'){
                $('.wrap-side-menu').css('display','none');
                $('.btn-show-menu-mobile').toggleClass('is-active');
            }
            if($('.sub-menu').css('display') == 'block'){
                $('.sub-menu').css('display','none');
                $('.arrow-main-menu').removeClass('turn-arrow');
            }
        }
    });


    /*[ remove top noti ]
    ===========================================================*/
    $('.btn-romove-top-noti').on('click', function(){
        $(this).parent().remove();
    })


    /*[ Block2 button wishlist ]
    ===========================================================*/
    $('.block2-btn-addwishlist').on('click', function(e){
        e.preventDefault();
        $(this).addClass('block2-btn-towishlist');
        $(this).removeClass('block2-btn-addwishlist');
        $(this).off('click');
    });

    /*[ +/- num product ]
    ===========================================================*/
    $('.btn-num-product-down').on('click', function(e){
        e.preventDefault();
        var numProduct = Number($(this).next().val());
        if(numProduct > 1) $(this).next().val(numProduct - 1);
    });

    $('.btn-num-product-up').on('click', function(e){
        e.preventDefault();
        var numProduct = Number($(this).prev().val());
        $(this).prev().val(numProduct + 1);
    });


    /*[ Show content Product detail ]
    ===========================================================*/
    $('.active-dropdown-content .js-toggle-dropdown-content').toggleClass('show-dropdown-content');
    $('.active-dropdown-content .dropdown-content').slideToggle('fast');

    $('.js-toggle-dropdown-content').on('click', function(){
        $(this).toggleClass('show-dropdown-content');
        $(this).parent().find('.dropdown-content').slideToggle('fast');
    });


    /*[ Play video 01]
    ===========================================================*/
    var srcOld = $('.video-mo-01').children('iframe').attr('src');

    $('[data-target="#modal-video-01"]').on('click',function(){
        $('.video-mo-01').children('iframe')[0].src += "&autoplay=1";

        setTimeout(function(){
            $('.video-mo-01').css('opacity','1');
        },300);      
    });

    $('[data-dismiss="modal"]').on('click',function(){
        $('.video-mo-01').children('iframe')[0].src = srcOld;
        $('.video-mo-01').css('opacity','0');
    });

})(jQuery);

function FetchItemCount() {    
    $.ajax({
        type: "POST",
        url: "../../Home.aspx/fetchItemCount",
        contentType: "application/json; charset=utf-8",        
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
    }); //ajax ends
};//function ends FetchItemCount

function getQueryStringValue(param) {
    var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < url.length; i++) {
        var urlparam = url[i].split('=');
        if (urlparam[0] == param) {
            return urlparam[1];
        }
    }
}//getQueryString Value

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
                    $("#cartItemCountMob").html(CartItemCount);
                }
            }
        },
        failure: function (response) {
            alert(response.d);
        }
    }); //Add to Cart ends
};//function ends addtocart

function getProductsHome() {
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
                               "<div class='col-md-12'><div style='text-align:left;display:inline-block;width:70%;'><span class='product-slider-title'>" + ProductSubCatList.pSName + "</span></div><div style='text-align:right;display:inline-block;width:25%;vertical-align: middle;'><a class='btn btn-primary prod-slid-btn' href='/product/products.aspx?scid=" + ProductSubCatList.pSID + "' role='button'>View More</a></div></div>" +
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
                                           "<a target='_blank' href='/product/productdetail.aspx?pid=" + ProductList.pPID + "'><img src='productimages/" + ProductList.pImageLink + "' alt='img' class='card-img-top'></a>" +
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
            }
        },
        failure: function (response) {
            alert(response.d);
        }
    }); //Product ends    
};//function ends getProductsHome
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
                        clickFunction = "UpdateCart(" + cIDetails.cProductID + ", " + JSON.stringify("subtract") + ");";
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
                if (parsedData && parsedData.UpdateSuccess != undefined && parsedData.UpdateSuccess != null) {
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
};//fn updatecart delete pt.

function getCartDetailsCheckout() {
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
                $("#spanSubTotal").html(JSON.parse(parsedData.cISubTotal));
                $("#spanShippingCharges").html(JSON.parse(parsedData.cIShippingCharges));
                $("#spanTotalAmount").html(JSON.parse(parsedData.cITotaAmount));
            }
        },
        failure: function (response) {
            alert(response.d);
        }
    });
};//getCartDetailsCheckout ends

function getState() {
    $.ajax({
        type: "POST",
        url: "../../checkout/checkout.aspx/getState",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response != "" && response.d.Data != 'undefined') {
                var parsedData = JSON.parse(response.d.Data);
                var stateList = JSON.parse(parsedData.stateList);
                $.each(stateList, function (key, stateList) {
                    $("#drpState").append("<option value='" + stateList.sID + "'>" + stateList.sName + "</option>");
                });//each ends
            }//if response ends
        },
        failure: function (response) {
            alert(response.d);
        }
    });
};//getState ends

//name, mobileID, address, pinCode, areaLocality, landMark, city, stateID, stateName
function saveAddress() {
    if ($("#txtName").val() != "" && $("#txtMob").val() != "" && $("#txtAddress").val() != "" && $("#txtPinCode").val() != "" && $("#txtArea").val() != "" && $("#txtLandMark").val() != "" && $("#txtCity").val() != "" && $("#drpState").val() != "" && $("#drpState option:selected").text() != "") {


        var dataValue = "{ name: '" + $("#txtName").val() + "', mobileID : '" + $("#txtMob").val() + "', address : '" + $("#txtAddress").val() + "', pinCode: '" + $("#txtPinCode").val() + "', areaLocality : '" + $("#txtArea").val() + "', landMark : '" + $("#txtLandMark").val() + "', city : '" + $("#txtCity").val() + "', stateID : '" + $("#drpState").val() + "',stateName : '" + $("#drpState option:selected").text() + "' }";
        $.ajax({
            type: "POST",
            url: "../../checkout/checkout.aspx/saveAddress",
            contentType: "application/json; charset=utf-8",
            data: dataValue,
            dataType: "json",
            success: function (response) {
                if (response != "" && response.d.Data != 'undefined') {
                    var parsedData = JSON.parse(response.d.Data);
                    var successAddressSave = JSON.parse(parsedData.successAddressSave);
                    if (successAddressSave != true) {
                        swal({ text: "Ooops! looks like there was error while saving address. Please try again." });
                    }
                    else {
                        $("#addNewAddress").trigger("click");
                        getAddresses();
                        clearAllBoxes();
                    }
                }
            },
            failure: function (response) {
                alert(response.d);
            }
        }); //update cart  ajax ends

    }
    else {
        swal({
            title: "Please enter all required fields",
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
};//fn saveAddress

function getAddresses() {
    $.ajax({
        type: "POST",
        url: "../../checkout/checkout.aspx/getUserAddresses",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response != "" && response.d.Data != 'undefined') {
                var parsedData = JSON.parse(response.d.Data);
                var addressList = JSON.parse(parsedData.addressList);
                var divHtml = "";
                $("#addressDiv").empty();
                $.each(addressList, function (key, addressList) {
                    var radioSelected = "";
                    if (key == 0) { radioSelected = "checked = 'checked'"; $("#selectedAddress").val(addressList.uDID); }
                    divHtml = "<div class='radio check-address'>" +
                            "<div class='checkout-address-button'><input id='userAddressID" + addressList.uDID + "' onclick='selectAddress(" + addressList.uDID + ");' type='radio' " + radioSelected + " name='optradio'>&nbsp;&nbsp;" + addressList.uDName + "</div>" +
                            "<div class='checkout-address-list'>" +
                            "<div class='to-address'>" + addressList.uDAddress + ", " + addressList.uDAreaLocality + ", " + addressList.uDLandmark +
                             ", " + addressList.uDCity + ", " + addressList.uDState + "- " + addressList.uDPinCode + "</div>" +
                            "<div class='to-mobile-no'>Mob. No. +91-" + addressList.uDmob + "</div>" +
                            "</div></div>";
                    $("#addressDiv").append(divHtml);
                });//each ends
            }//if response ends
        },
        failure: function (response) {
            alert(response.d);
        }
    });
};//getAddresses ends

function clearAllBoxes() {
    $("#txtName").val("");
    $("#txtMob").val("");
    $("#txtAddress").val("");
    $("#txtPinCode").val("");
    $("#txtArea").val("");
    $("#drpState").val("1");
    $("#txtCity").val("");
    $("#txtLandMark").val("");
};//clearAllBoxes ends


function btnConfirmOrderClientClick() {
    if ($("#selectedAddress") && $("#selectedAddress").val() != "") {
        swal({
            title: "Are you sure you want to place order along with selected items and address?",
            text: "Once you place order, we will get back to you on your registered Email ID and Contact Number.",
            cancelButtonColor: "#DD6B55",
            confirmButtonColor: "#DD6B55",
            showLoaderOnConfirm: true,
            buttons: {
                cancel: {
                    text: "Cancel",
                    value: false,
                    visible: true,
                    className: "",
                    dangerMode: true,
                    closeModal: true
                },
                confirm: {
                    text: "Yes, Confirm Order",
                    value: true,
                    visible: true,
                    className: "",
                    closeModal: false,
                    successMode: true
                }
            },
            dangerMode: false,
        })
    .then((yesSure) => {
        if (yesSure) {
            if ($("#selectedAddress") && $("#selectedAddress").val() != "") {
                var checkPincodeValid = checkIfValidPincode();
                if (checkPincodeValid == "True") {
                    swal({
                        title: 'Please Wait till next page appears, we are working on your request.',
                        timer: 20000,
                        buttons: false,
                        onOpen: () => {
                            swal.showLoading();
                        }
                    });
                    var dataValue = "{ address: '" + $("#selectedAddress").val() + "'}";
                    $.ajax({
                        type: "POST",
                        url: "../../checkout/checkout.aspx/confirmOrder",
                        contentType: "application/json; charset=utf-8",
                        data: dataValue,
                        dataType: "json",
                        success: function (response) {
                            if (response != "" && response.d.Data != 'undefined') {
                                var parsedData = JSON.parse(response.d.Data);
                                var orderDetail = JSON.parse(parsedData.orderDetail);
                                if (orderDetail && orderDetail.length > 0) {
                                    if (orderDetail[0] && orderDetail[0].oOID != undefined && orderDetail[0].oOID != null) {
                                        window.location.href = "/order/orderconfirmation.aspx?oID=" + orderDetail[0].oOID;
                                    }
                                    else if (orderDetail[0] && orderDetail[0].errorMessage != undefined && orderDetail[0].errorMessage != null) {
                                        swal({
                                            text: orderDetail[0].errorMessage,
                                            icon: "warning",
                                            buttons: true,
                                            dangerMode: true
                                        });
                                    }

                                }
                                else {
                                    swal({
                                        text: "Ooops! Something went wrong. Please try again with proper inputs.",
                                        icon: "warning",
                                        buttons: false,
                                        dangerMode: true,
                                    });
                                }
                            }//if response ends
                        },
                        failure: function (response) {
                            alert(response.d);
                        }
                    });  //ajax ends
                }///if pincode valid ends
                else {
                    swal({
                        text: "Thank you for showing interest in the above products, currently we are unable to deliver outside Pune region via cash on delivery option, we are working on payment integration methods. However for now if you wish to place the order connect with us to complete your order on Contact Number +91-8956678914. We will accept the order and dispatch it at the earliest.",
                        icon: "warning",
                        buttons: false,
                        dangerMode: true,
                    });
                }
            }
            else {
                swal({
                    text: "Ooops! Looks like you have not selected address for your order. Please select any address from your existing address list else add New Address.",
                    icon: "warning",
                    buttons: false,
                    dangerMode: true,
                });
            }
        }
        else { return false; }
    });///swal ends      
    }//select address ends     
    else {
        swal({
            text: "Ooops! Looks like you have not selected address for your order. Please select any address from your existing address list else add New Address.",
            icon: "warning",
            buttons: false,
            dangerMode: true,
        });
    }
}//btnconfirmorder ends

function checkIfValidPincode() {
    var dataValue = "{ address: '" + $("#selectedAddress").val() + "'}";
    var result = false;
    $.ajax({
        type: "POST",
        url: "../../checkout/checkout.aspx/checkValidPincode",
        contentType: "application/json; charset=utf-8",
        data: dataValue,
        async: false,
        dataType: "json",
        success: function (response) {
            if (response != "" && response.d.Data != 'undefined') {
                var parsedData = JSON.parse(response.d.Data);
                if (parsedData != null && parsedData != undefined) {
                    var checkValidPincode = JSON.parse(parsedData.checkValidPincode);
                    result = checkValidPincode;
                }
                else { result = false; }
            }//if response ends
        },
        failure: function (response) {
            alert(response.d);
        }
    });
    return result;
};//checkIfValidPincode ends


function selectAddress(selectedAddress) {
    $("#selectedAddress").val(selectedAddress);
}//selectAddres ends

function getOrderConfirmationData() {
    var dataValue = "{ orderID: '" + getQueryStringValue("oID") + "'}";
    $.ajax({
        type: "POST",
        url: "../../order/orderconfirmation.aspx/getOrderConfirmationData",
        contentType: "application/json; charset=utf-8",
        data: dataValue,
        dataType: "json",
        success: function (response) {
            if (response != "" && response.d.Data != 'undefined') {
                var parsedData = JSON.parse(response.d.Data);
                var orderDetails = JSON.parse(parsedData.orderDetails);
                if (orderDetails && orderDetails.length > 0) {
                    $("#spanOrderNumber").html("ORD" + orderDetails[0].oID);
                    $("#spanExpectedDeliveryDate").html(orderDetails[0].oExpectedDeliveryDate);
                    $("#delvAddress").html(orderDetails[0].uDAddress + ", " + orderDetails[0].uDAreaLocality + ", " + orderDetails[0].uDLandmark +
                             ", " + orderDetails[0].uDCity + ", " + orderDetails[0].uDState + "- " + orderDetails[0].uDPinCode);
                    $("#delvName").html(orderDetails[0].oCustomerName);
                    $("#delvMob").html(orderDetails[0].uDmob);
                    $("#totalAmount").html(orderDetails[0].oTotalAmount);
                    $("#OrderItems").empty();
                    $.each(orderDetails, function (key, orderDetails) {
                        var divHtml = "<div class='order-prod-list'><div class='order-prod-img'>" +
                                       "<a href='/product/productdetail.aspx?pid=" + orderDetails.pID + "'><img src='/productimages/" + orderDetails.oImageLink1 + "' class='cart-img-product'></a></div>" +
                                        "<div class='order-prod-nm'><a href='/product/productdetail.aspx?pid=" + orderDetails.pID + "'><span>" + orderDetails.oProductName + "</span></a></div>" +
                                        "<div class='order-prod-qty'><span>Qty: " + orderDetails.oProductQuantity + "</span></div>" +
                                        "<div class='order-prod-prc'><span>Price:&nbsp;&#8377;" + orderDetails.oItemFinalPrice + "</span></div></div><hr />";
                        $("#OrderItems").append(divHtml);
                    });//for each ends
                }
            }
        },
        failure: function (response) {
            alert(response.d);
        }
    });///ajax ends 
};//fnction getOrderConfirmation Ends