<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ProductEntry.aspx.cs" Inherits="ArtCrestApplication.acsupport.ProductEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <section class="">
            <div class="container">                
                <div class="reg-box">
                    <asp:Label ID="lblErrorMsg" runat="server"></asp:Label> <br />
                    <label for="uname"><b>Product Name</b></label>
                    <asp:TextBox runat="server" class="login-input" placeholder="Enter Product Name" ID="txtProductName" name="txtProductName" required />

                    <label for="uname"><b>Description</b></label>
                    <asp:TextBox TextMode="MultiLine" runat="server" class="login-input" placeholder="Enter Product Description" ID="txtProductDesc" name="txtProductDesc" />

                    <label for="uname"><b>Product Features</b></label>
                    <asp:TextBox TextMode="MultiLine" runat="server" class="login-input" placeholder="Enter Product Features" ID="txtProductFeatures" name="txtProductFeatures" />

                    <label for="uname"><b>Product Super Category</b></label>
                    <asp:DropDownList class="login-input"  runat="server" ID="drpSuperCategory" AutoPostBack="true" OnSelectedIndexChanged="drpSuperCategory_SelectedIndexChanged"></asp:DropDownList>

                    <label for="uname"><b>Product Category</b></label>
                    <asp:DropDownList class="login-input" runat="server" ID="drpCategory" AutoPostBack="true" OnSelectedIndexChanged="drpCategory_SelectedIndexChanged"></asp:DropDownList>

                    <label for="uname"><b>Product Sub Category</b></label>
                    <asp:DropDownList class="login-input" runat="server" ID="drpSubCategory"></asp:DropDownList>

                    <label for="uname"><b>Product Base Price</b></label>
                    <asp:TextBox runat="server" class="login-input" placeholder="Enter Base Price" ID="txtProductBasePrice" name="txtProductBasePrice" required />

                    <label for="uname"><b>Margin %</b></label>
                    <asp:TextBox runat="server" class="login-input" placeholder="Enter Margin" ID="txtMarginPercent" name="txtMarginPercent" required />

                    <label for="uname"><b>CGST %</b></label>
                    <asp:TextBox runat="server" class="login-input" placeholder="Enter CGST" ID="txtCGST" name="txtCGST" required />

                    <label for="uname"><b>SGST %</b></label>
                    <asp:TextBox runat="server" class="login-input" placeholder="Enter SGST" ID="txtSGST" name="txtSGST" required />

                    <label for="uname"><b>Discount %</b></label>
                    <asp:TextBox runat="server" class="login-input" placeholder="Enter Discount Percent" ID="txtDiscountPercent" name="txtDiscountPercent" required />

                    <label for="uname"><b>Product Quantity</b></label>
                    <asp:TextBox runat="server" class="login-input" placeholder="Enter Product Quantity" ID="txtProductQuantity" name="txtProductQuantity" required />

                    <label for="uname"><b>Product Search Alias</b></label>
                    <asp:TextBox TextMode="MultiLine" runat="server" class="login-input" placeholder="Enter Product Search Alias" ID="txtSearchAlias" name="txtSearchAlias" />

                    <label for="uname"><b>Vendor</b></label>
                    <asp:DropDownList class="login-input"  runat="server" ID="drpVendor">
                         <asp:ListItem Text="Skartif" Value="1"></asp:ListItem>
                    </asp:DropDownList>

                    <label for="uname"><b>Return Policy</b></label>
                    <asp:DropDownList runat="server" ID="drpReturnPolicy" class="login-input" >
                        <asp:ListItem Text="There will be no charges if you return product within 24hours after delivery." Value="1"></asp:ListItem>
                    </asp:DropDownList>

                    <label for="uname"><b>Active</b></label>
                    <asp:CheckBox runat="server" ID="chkIsActive"></asp:CheckBox>

                    <label for="uname"><b>Product Image 1</b></label>
                    <asp:FileUpload class="login-input"  runat="server" ID="imageUpload1" />

                    <label for="uname"><b>Product Image 2</b></label>
                    <asp:FileUpload class="login-input"  runat="server" ID="imageUpload2" />

                    <label for="uname"><b>Product Image 3</b></label>
                    <asp:FileUpload class="login-input"  runat="server" ID="imageUpload3" />

                    <asp:Button Text="Save Product" class="login-btn" runat="server" ID="btnSaveProduct" OnClick="btnSaveProduct_Click" />                    
                </div>
            </div>
        </section>
    </div>
</asp:Content>
