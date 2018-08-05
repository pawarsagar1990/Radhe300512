using System;
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
    public partial class ProductEdit : System.Web.UI.Page
    {
        BusinessLayer.BusinessLayer objBusinessL = new BusinessLayer.BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindSuperCategory();
                bindCategory(0);
                bindSubCategory(0);
                //bindVendor();
                EditSection.Visible = false;
            }
        }

        protected void btnSaveProduct_Click(object sender, EventArgs e)
        {
            lblErrorMsg.Text = "";            
            try
            {
                int ProductID = Convert.ToInt32(productID.Value);
                Dictionary<string, string> parameters = new Dictionary<string, string>();
                decimal productSellPrice = 0;
                decimal discountedPrice = 0;
                decimal productBaseMarginPrice = Convert.ToDecimal(txtProductBasePrice.Text) + (Convert.ToDecimal(txtMarginPercent.Text) / 100 * Convert.ToDecimal(txtProductBasePrice.Text));
                productBaseMarginPrice = Math.Round(productBaseMarginPrice);
                productSellPrice = productBaseMarginPrice + (((Convert.ToDecimal(txtCGST.Text) + Convert.ToDecimal(txtSGST.Text)) / 100) * productBaseMarginPrice);
                productSellPrice = Math.Round(productSellPrice);
                discountedPrice = productSellPrice - (productSellPrice * (Convert.ToDecimal(txtDiscountPercent.Text) / 100));
                discountedPrice = Math.Round(discountedPrice);
                parameters.Add("pProdID", ProductID.ToString());
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
                parameters.Add("pUpdatedBy", Session["SupportLoginID"].ToString());
                parameters.Add("pUpdatedDate", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"));

                string query = "Update [dbo].[Product] SET [ProductName] = @pName,[ProductDesc] = @pdesc,[ProductFeatures] = @pFeatures,[fkProductSuperCategoryID] = @pSupCat,[fkProductCategoryID] = @pCat," +
                                "[fkProductSubCategoryID] = @pSubCat,[ProductBasePrice] = @pBasrPrice,[ACMarginPercent] = @pMarginPercent,[CGSTPercent] = @pCGST" +
                                ",[SGSTPercent] = @pSGST,[DiscountPercent] = @pDiscountPercent,[ProductSellPrice] = @pSellPrice,[ProductDiscountPrce] = @pDiscountedPrice,[ProductQuantity] = @pQuantity," +
                                "[ProductSearchAlias] = @pSearchAlias,[fkVendorID] = @pVendor,[IsActive] = @pIsActive,[fkReturnPolicyID] = @pReturnPolicy,[UpdatedBy] = @pUpdatedBy,[UpdatedDate] = @pUpdatedDate" +
                                " WHERE ProductID = @pProdID;";

                int updateResult = DataAccessLayer.DataAccessLayer.ExecuteNonQuery(query, parameters);
                if (updateResult > 0)
                {
                    Dictionary<string, string> parametersImageSave = new Dictionary<string, string>();
                    string imageQuery = "";
                    if (imageUpload1.HasFile)
                    {
                        parametersImageSave.Add("piImageLink1", saveFileIntoFolder(ProductID, txtProductName.Text, imageUpload1));
                        imageQuery = "[ImageLink1] = @piImageLink1,";
                    }
                    if (imageUpload2.HasFile)
                    {
                        parametersImageSave.Add("piImageLink2", saveFileIntoFolder(ProductID, txtProductName.Text, imageUpload2));
                        imageQuery = imageQuery != string.Empty ? imageQuery + "[ImageLink2] = @piImageLink2," : "[ImageLink2] = @piImageLink2,";
                    }
                    if (imageUpload1.HasFile)
                    {
                        parametersImageSave.Add("piImageLink3", saveFileIntoFolder(ProductID, txtProductName.Text, imageUpload3));
                        imageQuery = imageQuery != string.Empty ? imageQuery + "[ImageLink3] = @piImageLink3," : "[ImageLink3] = @piImageLink3,";
                    }
                    parametersImageSave.Add("piFkProductID", ProductID.ToString());
                    parametersImageSave.Add("piUpdatedBy", Session["SupportLoginID"].ToString());
                    parametersImageSave.Add("piUpdatedDate", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"));
                    string productImageQuery = "UPDATE [dbo].[ProductImage] SET " + imageQuery +
                                                "[UpdatedBy] = @piUpdatedBy,[UpdatedDate] = @piUpdatedDate WHERE fkProductID = @piFkProductID;";
                    
                    int productImageResult = DataAccessLayer.DataAccessLayer.ExecuteNonQuery(productImageQuery, parametersImageSave);
                    if (productImageResult <= 0)
                    {
                        ShowErrorMsg("Product Update Completed but there is an error while product image save, please check with Administrator.", true);
                    }
                    else
                    { ShowErrorMsg("Product Update Completed.", false); }
                    
                }
                else
                { ShowErrorMsg("There is an error while product updation, please check with Administrator.", true); }

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
            DataTable dtSuperCategory = objBusinessL.GetSuperCategory();
            if (dtSuperCategory != null && dtSuperCategory.Rows.Count > 0)
            {
                drpSuperCategory.DataSource = dtSuperCategory;
                drpSuperCategory.DataTextField = "ProductSuperCategoryName";
                drpSuperCategory.DataValueField = "ProductSuperCategoryID";
                drpSuperCategory.DataBind();
                drpSuperCategory.Items.Insert(0, new ListItem("Please Select", "0"));

                drpSuperCategorySearch.DataSource = dtSuperCategory;
                drpSuperCategorySearch.DataTextField = "ProductSuperCategoryName";
                drpSuperCategorySearch.DataValueField = "ProductSuperCategoryID";
                drpSuperCategorySearch.DataBind();
                drpSuperCategorySearch.Items.Insert(0, new ListItem("Please Select", "0"));
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

                drpCategorySearch.DataSource = dtCategory;
                drpCategorySearch.DataTextField = "ProductCategoryName";
                drpCategorySearch.DataValueField = "ProductCategoryID";
                drpCategorySearch.DataBind();
                drpCategorySearch.Items.Insert(0, new ListItem("Please Select", "0"));
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

                drpSubCategorySearch.DataSource = dtSubCategory;
                drpSubCategorySearch.DataTextField = "ProductSubCategoryName";
                drpSubCategorySearch.DataValueField = "ProductSubCategoryID";
                drpSubCategorySearch.DataBind();
                drpSubCategorySearch.Items.Insert(0, new ListItem("Please Select", "0"));
            }
        }

        public void bindProducts(int productSubCategoryID)
        {
            DataTable dtProduct = objBusinessL.GetProductsFromSubCategory(productSubCategoryID);
            if (dtProduct != null && dtProduct.Rows.Count > 0)
            {
                drpProduct.DataSource = dtProduct;
                drpProduct.DataTextField = "ProductName";
                drpProduct.DataValueField = "ProductID";                
                drpProduct.DataBind();
                drpProduct.Items.Insert(0, new ListItem("Please Select", "0"));
                
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
                
        protected void drpSuperCategorySearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindCategory(Convert.ToInt32(drpSuperCategorySearch.SelectedValue));            
        }
        protected void drpCategorySearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindSubCategory(Convert.ToInt32(drpCategorySearch.SelectedValue));
        }

        protected void drpSubCategorySearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindProducts(Convert.ToInt32(drpCategorySearch.SelectedValue));
        }

        protected void drpSuperCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindCategory(Convert.ToInt32(drpSuperCategory.SelectedValue));
        }
        protected void drpCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindSubCategory(Convert.ToInt32(drpCategory.SelectedValue));
        }
        protected void drpProductSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            EditSection.Visible = true;
            productID.Value = drpProduct.SelectedValue;
            DataTable dtProduct = objBusinessL.GetProductDetailOnProductID(Convert.ToInt32(drpProduct.SelectedValue));
            if (dtProduct != null && dtProduct.Rows.Count > 0)
            {
                txtProductName.Text = dtProduct.Rows[0]["ProductName"].ToString();
                txtProductDesc.Text = dtProduct.Rows[0]["ProductDesc"].ToString();
                txtProductFeatures.Text = dtProduct.Rows[0]["ProductFeatures"].ToString();
                drpSuperCategory.SelectedValue = dtProduct.Rows[0]["fkProductSuperCategoryID"].ToString();
                drpCategory.SelectedValue = dtProduct.Rows[0]["fkProductCategoryID"].ToString();
                drpSubCategory.SelectedValue = dtProduct.Rows[0]["fkProductSubCategoryID"].ToString();
                txtProductBasePrice.Text = dtProduct.Rows[0]["ProductBasePrice"].ToString();
                txtMarginPercent.Text = dtProduct.Rows[0]["ACMarginPercent"].ToString();
                txtCGST.Text = dtProduct.Rows[0]["CGSTPercent"].ToString();
                txtSGST.Text = dtProduct.Rows[0]["SGSTPercent"].ToString();
                txtDiscountPercent.Text = dtProduct.Rows[0]["DiscountPercent"].ToString();
                txtProductQuantity.Text = dtProduct.Rows[0]["ProductQuantity"].ToString();
                txtSearchAlias.Text = dtProduct.Rows[0]["ProductSearchAlias"].ToString();
                drpVendor.SelectedValue = dtProduct.Rows[0]["fkVendorID"].ToString();
                drpReturnPolicy.SelectedValue = dtProduct.Rows[0]["fkReturnPolicyID"].ToString();
                chkIsActive.Checked = Convert.ToBoolean(dtProduct.Rows[0]["isActive"].ToString());
            }
        }        
    }
}