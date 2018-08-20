<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="ArtCrestApplicationWeb.contactus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <!-- Title Page -->
	<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(images/heading-pages-06.jpg);">
		<h2 class="l-text2 t-center">
			Contact
		</h2>
	</section>

	<!-- content page -->
	<section class="bgwhite p-t-66 p-b-60">
        <div class="container">
            <div class="row">
                <div class="col-md-6 p-b-30">
                    <div class="p-r-20 p-r-0-lg">
                        <div class="contact-map size21" id="google_map" data-map-x="19.9886705" data-map-y="73.7689015" data-pin="images/icons/map.png" data-scrollwhell="0" data-draggable="1"></div>
                    </div>
                </div>

                <div class="col-md-6 p-b-30">
                    <!--<form class="leave-comment">
                        <h4 class="m-text26 p-b-36 p-t-15">Send us your message
                        </h4>

                        <div class="bo4 of-hidden size15 m-b-20">
                            <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="name" placeholder="Full Name">
                        </div>

                        <div class="bo4 of-hidden size15 m-b-20">
                            <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="phone-number" placeholder="Phone Number">
                        </div>

                        <div class="bo4 of-hidden size15 m-b-20">
                            <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="email" placeholder="Email Address">
                        </div>

                        <textarea class="dis-block s-text7 size20 bo4 p-l-22 p-r-22 p-t-13 m-b-20" name="message" placeholder="Message"></textarea>

                        <div class="w-size25">
                            <button class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
                                Send
                            </button>
                        </div>
                    </form>-->
                    <h4 class="m-text26 p-b-36 p-t-15">
                        Contact Us
                    </h4>
                    <span style="font-weight:bold;color:#1f0a50;">Mailing Address:</span><br />
                    <span>skartif Private Limited,</span><br />
                    <span>B-404, Lamboder Avenue, Pushpanjali Nagar,</span><br />
                    <span>Sadguru Link Road, Nasik, PIN: 422002</span> <br /><br />
                    <span style="font-weight:bold;color:#1f0a50;">OR</span><br /><br />
                    <span>Email us at info@skartif.com</span><br />
                    <span>Call us on +91-8839485414</span><br />
                </div>
            </div>
        </div>
	</section>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
	<script src="js/map-custom.js"></script>

</asp:Content>
