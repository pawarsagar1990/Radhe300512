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
                    <img src="images/master-slide-01.jpg" alt="ms1" style="width:100%;">
                </div>
                <div class="carousel-item">
                    <img src="images/master-slide-02.jpg" alt="ms2" style="width:100%;"">
                </div>
                <div class="carousel-item">
                    <img src="images/master-slide-03.jpg" alt="ms3" style="width:100%;">
                </div>
                <div class="carousel-item">
                    <img src="images/master-slide-04.jpg" alt="ms4" style="width:100%;">
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

    <div class="container" style="text-align:center;color:#fd0e91;padding-top:20px;font-weight:bold;font-size:20px;">
        <span>Free shipping on orders above Rs.150 & 1 day delivery available within Pune.</span>
    </div>

    <div id="ProductSlider"></div>
    <script type="text/javascript">
        $(document).ready(function () {
            getProductsHome();
        });

        function RedirectToLogin() {
            window.location.href = "login.aspx";
        }
    </script>
    <asp:HiddenField runat="server" ID="hdnUserID" ClientIDMode="Static" />
</asp:Content>
