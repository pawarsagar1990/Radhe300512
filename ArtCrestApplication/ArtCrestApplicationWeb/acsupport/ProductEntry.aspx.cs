﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
using DataAccessLayer;

namespace ArtCrestApplication.acsupport
{
    public partial class ProductEntry : System.Web.UI.Page
    {
        BusinessLayer.BusinessLayer objBusinessL = new BusinessLayer.BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindSuperCategory();
                bindCategory();
                bindSubCategory();
                bindVendor();
            }
        }

        protected void btnSaveProduct_Click(object sender, EventArgs e)
        {
            lblErrorMsg.Text = "";
            int ProductID = 0;
            try
            {
                Dictionary<string, string> parameters = new Dictionary<string, string>();
                decimal productSellPrice = 0;
                decimal discountedPrice = 0;
                decimal productBaseMarginPrice = Convert.ToDecimal(txtProductBasePrice.Text) + (Convert.ToDecimal(txtMarginPercent.Text) / 100 * Convert.ToDecimal(txtProductBasePrice.Text));
                productBaseMarginPrice = Math.Round(productBaseMarginPrice);
                productSellPrice = productBaseMarginPrice + (((Convert.ToDecimal(txtCGST.Text) + Convert.ToDecimal(txtSGST.Text)) / 100) * productBaseMarginPrice);
                productSellPrice = Math.Round(productSellPrice);
                discountedPrice = productSellPrice - (productSellPrice * (Convert.ToDecimal(txtDiscountPercent.Text) / 100));
                discountedPrice = Math.Round(discountedPrice);
                parameters.Add("pName", txtProductName.Text);
                parameters.Add("pdesc", txtProductDesc.Text);
                parameters.Add("pFeatures", txtProductFeatures.Text);
                parameters.Add("pSupCat", drpSuperCategory.SelectedValue);
                parameters.Add("pCat", drpCategory.SelectedValue);
                parameters.Add("pSubCat", drpSubCategory.SelectedValue);
                parameters.Add("pBasrPrice", Convert.ToInt32(Math.Round(Convert.ToDecimal(txtProductBasePrice.Text))).ToString());
                parameters.Add("pMarginPercent", Convert.ToInt32(Math.Round(Convert.ToDecimal(txtMarginPercent.Text))).ToString());
                parameters.Add("pCGST", txtCGST.Text);
                parameters.Add("pSGST", txtSGST.Text);
                parameters.Add("pDiscountPercent", Convert.ToInt32(Math.Round(Convert.ToDecimal(txtDiscountPercent.Text))).ToString());
                parameters.Add("pSellPrice", Convert.ToInt32(productSellPrice).ToString());
                parameters.Add("pDiscountedPrice", Convert.ToInt32(discountedPrice).ToString());
                parameters.Add("pQuantity", txtProductQuantity.Text);
                parameters.Add("pSearchAlias", txtSearchAlias.Text);
                parameters.Add("pVendor", drpVendor.SelectedValue);
                parameters.Add("pIsActive", chkIsActive.Checked.ToString());
                parameters.Add("pReturnPolicy", drpReturnPolicy.SelectedValue);
                parameters.Add("pCreatedBy", Session["SupportLoginID"].ToString());              
                parameters.Add("pCreatedDate", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"));
                parameters.Add("pUpdatedBy", Session["SupportLoginID"].ToString());
                parameters.Add("pUpdatedDate", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"));

                string query = "INSERT INTO [dbo].[Product] ([ProductName],[ProductDesc],[ProductFeatures],[fkProductSuperCategoryID],[fkProductCategoryID]," +
                                "[fkProductSubCategoryID],[ProductBasePrice],[ACMarginPercent],[CGSTPercent]" +
                                ",[SGSTPercent],[DiscountPercent],[ProductSellPrice],[ProductDiscountPrce],[ProductQuantity]," +
                                "[ProductSearchAlias],[fkVendorID],[IsActive],[fkReturnPolicyID],[CreatedBy],[CreatedDate],[UpdatedBy],[UpdatedDate])" +
                                "VALUES(@pName,@pdesc,@pFeatures,@pSupCat,@pCat,@pSubCat,@pBasrPrice,@pMarginPercent,@pCGST,@pSGST,@pDiscountPercent,@pSellPrice,@pDiscountedPrice," +
                                "@pQuantity,@pSearchAlias,@pVendor,@pIsActive,@pReturnPolicy,@pCreatedBy,@pCreatedDate,@pUpdatedBy,@pUpdatedDate);";

                int insertResult = DataAccessLayer.DataAccessLayer.ExecuteNonQuery(query, parameters);
                if (insertResult > 0)
                {
                    Dictionary<string, string> Productparameters = new Dictionary<string, string>();
                    Productparameters.Add("productName", txtProductName.Text);                    
                    string productgetquery = "select * from product where ProductName = @productName";
                    DataTable dtProduct = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(productgetquery, Productparameters);
                    if (dtProduct != null & dtProduct.Rows.Count > 0)
                    {
                        ProductID = Convert.ToInt32(dtProduct.Rows[0]["ProductID"]);
                    }
                    Dictionary<string, string> parametersImageSave = new Dictionary<string, string>();
                    string imageQuery = "";
                    string imageQueryValues = "";
                    if (imageUpload1.HasFile)
                    {
                        parametersImageSave.Add("piImageLink1", saveFileIntoFolder(ProductID, txtProductName.Text, imageUpload1));
                        imageQuery = "[ImageLink1],";
                        imageQueryValues = "@piImageLink1,";
                    }
                    if (imageUpload2.HasFile)
                    {
                        parametersImageSave.Add("piImageLink2", saveFileIntoFolder(ProductID, txtProductName.Text, imageUpload2));
                        imageQuery = imageQuery != string.Empty ? imageQuery + "[ImageLink2]," : "[ImageLink2],";
                        imageQueryValues = imageQueryValues != string.Empty ? imageQueryValues + "@piImageLink2," : "@piImageLink2,";                        
                    }
                    if (imageUpload3.HasFile)
                    {
                        parametersImageSave.Add("piImageLink3", saveFileIntoFolder(ProductID, txtProductName.Text, imageUpload3));
                        imageQuery = imageQuery != string.Empty ? imageQuery + "[ImageLink3]," : "[ImageLink3],";
                        imageQueryValues = imageQueryValues != string.Empty ? imageQueryValues + "@piImageLink3," : "@piImageLink3,";
                    }
                    parametersImageSave.Add("piFkProductID", ProductID.ToString());
                    parametersImageSave.Add("piCreatedBy", Session["SupportLoginID"].ToString());
                    parametersImageSave.Add("piCreatedDate", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"));
                    parametersImageSave.Add("piUpdatedBy", Session["SupportLoginID"].ToString());
                    parametersImageSave.Add("piUpdatedDate", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"));
                    string productImageQuery = "INSERT INTO[dbo].[ProductImage]("+ imageQuery + " [fkProductID],[CreatedBy],[CreatedDate]" +
                                                ",[UpdatedBy],[UpdatedDate]) VALUES("+ imageQueryValues + " @piFkProductID,@piCreatedBy,@piCreatedDate,@piUpdatedBy,@piUpdatedDate);";

                    int productImageResult = DataAccessLayer.DataAccessLayer.ExecuteNonQuery(productImageQuery, parametersImageSave);
                    if (productImageResult <= 0)
                    {
                        ShowErrorMsg("Product Save Completed but there is an error while product image save, please check with Administrator.", true);
                    }
                    else
                    { ShowErrorMsg("Product Save Completed.", false); }
                    
                }
                else
                { ShowErrorMsg("There is an error while product creation, please check with Administrator.", true); }

            }
            catch (Exception ex)
            {
                ShowErrorMsg(ex.Message, true);
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "btnSaveProduct", "E", Session["SupportLoginID"].ToString());
            }
        }
        public void ShowErrorMsg(string msg, bool isError)
        {
            lblErrorMsg.Text = msg;
            lblErrorMsg.Font.Bold = true;
            lblErrorMsg.Visible = true;
            if (isError)
            {
                lblErrorMsg.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblErrorMsg.ForeColor = System.Drawing.Color.Green;
            }
        }

        public void bindSuperCategory()
        {
            DataTable dtSuperCategory = objBusinessL.getDataFromQuery("select * from ProductSuperCategory where isactive = 1 order by 1 asc");
            if (dtSuperCategory != null && dtSuperCategory.Rows.Count > 0)
            {
                drpSuperCategory.DataSource = dtSuperCategory;
                drpSuperCategory.DataTextField = "ProductSuperCategoryName";
                drpSuperCategory.DataValueField = "ProductSuperCategoryID";
                drpSuperCategory.DataBind();
            }
        }
        public void bindCategory()
        {
            DataTable dtCategory = objBusinessL.getDataFromQuery("select * from ProductCategory where isactive = 1 order by 1 asc");
            if (dtCategory != null && dtCategory.Rows.Count > 0)
            {
                drpCategory.DataSource = dtCategory;
                drpCategory.DataTextField = "ProductCategoryName";
                drpCategory.DataValueField = "ProductCategoryID";
                drpCategory.DataBind();
            }
        }

        public void bindSubCategory()
        {
            DataTable dtCategory = objBusinessL.getDataFromQuery("select * from ProductSubCategory where isactive = 1 order by 1 asc");
            if (dtCategory != null && dtCategory.Rows.Count > 0)
            {
                drpSubCategory.DataSource = dtCategory;
                drpSubCategory.DataTextField = "ProductSubCategoryName";
                drpSubCategory.DataValueField = "ProductSubCategoryID";
                drpSubCategory.DataBind();
            }
        }

        public void bindCategory(int productsupercategoryID)
        {
            DataTable dtCategory = objBusinessL.GetCategory(productsupercategoryID);
            if (dtCategory != null && dtCategory.Rows.Count > 0)
            {
                drpCategory.DataSource = dtCategory;
                drpCategory.DataTextField = "ProductCategoryName";
                drpCategory.DataValueField = "ProductCategoryID";
                drpCategory.DataBind();
                drpCategory.Items.Insert(0, new ListItem("Please Select", "0"));
            }
        }

        public void bindSubCategory(int productCategoryID)
        {
            DataTable dtSubCategory = objBusinessL.GetSubCategory(productCategoryID);
            if (dtSubCategory != null && dtSubCategory.Rows.Count > 0)
            {
                drpSubCategory.DataSource = dtSubCategory;
                drpSubCategory.DataTextField = "ProductSubCategoryName";
                drpSubCategory.DataValueField = "ProductSubCategoryID";
                drpSubCategory.DataBind();
                drpSubCategory.Items.Insert(0, new ListItem("Please Select", "0"));              
            }
        }        

        public void bindVendor()
        {
            //drpVendor.Items.Add(new ListItem("Skartif", "1"));
            ////DataTable dtCategory = objBusinessL.getDataFromQuery("select * from Vendor where isactive = 1 order by 1 asc");
            ////if (dtCategory != null && dtCategory.Rows.Count > 0)
            ////{
            ////    drpVendor.DataSource = dtCategory;
            ////    drpVendor.DataTextField = "VendorName";
            ////    drpVendor.DataValueField = "VendorID";
            ////    drpVendor.DataBind();
            ////}
            ////else
            ////{
            ////    drpVendor.Items.Add(new ListItem("Skartif", "1"));
            ////}
        }
        
        public bool validateFileTypes(FileUpload fileControl)
        {
            if (fileControl.HasFile)
            {
                string DocType = Path.GetExtension(fileControl.PostedFile.FileName);
                if (DocType.ToLower() == ".jpeg" || DocType.ToLower() == ".jpg" || DocType.ToLower() == ".png")
                {
                    return true;
                }
                else
                {
                    ShowErrorMsg("Please check one of the file type is not supported by our system.", true);
                    return false;
                }
            }
            else
            {
                return true;
            }
        }
        
        public string saveFileIntoFolder(int ProductID, string ProductName, FileUpload fileControl)
        {
            string fileLink = "";
            try
            {
                if (validateFileTypes(fileControl))
                {
                    string DocType = Path.GetExtension(fileControl.PostedFile.FileName);
                    int fileNumber = 0;
                    string fileName = ProductName + "_" + ProductID + "_" + fileNumber + "" + DocType;
                    do
                    {
                        if (System.IO.File.Exists(Server.MapPath("~/productimages/") + fileName))
                        {
                            fileNumber = fileNumber + 1;
                            fileName = ProductName + "_" + ProductID + "_" + fileNumber + "" + DocType;
                        }
                        else
                        {
                            break;
                        }

                    } while (System.IO.File.Exists(Server.MapPath("~/productimages/") + fileName));
                    fileControl.PostedFile.SaveAs(Server.MapPath("~/productimages/") + fileName);
                    fileLink = fileName;
                }                           
            }
            catch (Exception ex)
            {
                ShowErrorMsg(ex.Message, true);
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + ex.StackTrace.ToString(), "Method Name : saveFileIntoFolder ", "E", Convert.ToString(Session["SupportLoginID"]));
                return fileLink;
            }            
            return fileLink;
        }

        protected void drpSuperCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindCategory(Convert.ToInt32(drpSuperCategory.SelectedValue));
        }
        protected void drpCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindSubCategory(Convert.ToInt32(drpCategory.SelectedValue));
        }
    }
}