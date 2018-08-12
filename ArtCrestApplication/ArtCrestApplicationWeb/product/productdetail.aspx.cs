using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
using DataAccessLayer;


namespace ArtCrestApplicationWeb.product
{
    public partial class productdetails : System.Web.UI.Page
    {
        BusinessLayer.BusinessLayer objBusinessL = new BusinessLayer.BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            hdnProductID.Value = "";
            string productID = Request.QueryString["pid"] != null ? Convert.ToString(Request.QueryString["pid"]) : "";
            if (productID != "")
            {
                hdnProductID.Value = productID;
            }
            else
            {
                ShowErrorMsg("Oops! looks like you have tried incorrect link, please try correct link from email.", true);
            }
        }


        public DataTable getProductDetails(string productID)
        {
            Dictionary<string, string> fetchProductDetailParameters = new Dictionary<string, string>();
            fetchProductDetailParameters.Add("productID", productID);
            string fetchProductQuery = "select * from Product prod,ProductSuperCategory sprod,ProductCategory cprod,ProductSubCategory scprod,ProductImage iprod where prod.fkProductSuperCategoryID=sprod.ProductSuperCategoryID and prod.fkProductCategoryID=cprod.ProductCategoryID and prod.fkProductSubCategoryID=scprod.ProductSubCategoryID and prod.ProductID=iprod.fkProductID and prod.ProductID=@productID";
            DataTable dtProducts = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(fetchProductQuery, fetchProductDetailParameters);
            return dtProducts;
        }

        [WebMethod]
        public static JsonResult getProductDetailList(string productID)
        {
            JsonResult objJson = new JsonResult();
            JavaScriptSerializer objJS = new JavaScriptSerializer();
            try
            {
                int hdnProductID = Convert.ToInt32(productID);
                productdetails objproductdetail = new productdetails();
                DataTable dtProducts = objproductdetail.getProductDetails(hdnProductID.ToString());
                string[] strResultArray = new string[1];
                if (dtProducts != null && dtProducts.Rows.Count > 0)
                {
                    var ProdDetailList = (from dt in dtProducts.AsEnumerable()
                                          select new
                                          {
                                              pPID = dt["ProductID"],
                                              pPName = dt["ProductName"],
                                              pPDesc = dt["ProductDesc"],
                                              pPFeatures = dt["ProductFeatures"],
                                              pPDiscountPercent = dt["DiscountPercent"],
                                              pPSellPrice = dt["ProductSellPrice"],
                                              pPDiscountPrice = dt["ProductDiscountPrce"],
                                              pPQuantity = dt["ProductQuantity"],
                                              pImageLink1 = dt["ImageLink1"] != DBNull.Value ? dt["ImageLink1"] : "item-01.jpg",
                                              pImageLink2 = dt["ImageLink2"] != DBNull.Value ? dt["ImageLink2"] : "item-01.jpg",
                                              pImageLink3 = dt["ImageLink3"] != DBNull.Value ? dt["ImageLink3"] : "item-01.jpg",
                                              pSuperCategoryName = dt["ProductSuperCategoryName"],
                                              pCategoryName = dt["ProductCategoryName"],
                                              pSubCategoryName = dt["ProductSubCategoryName"],
                                              pProdSubCategoryID = dt["fkProductSubCategoryID"]
                                          }).ToList();

                    strResultArray[0] = objJS.Serialize(ProdDetailList);
                }

                var genericResult = new
                {
                    ProductDetailList = strResultArray[0],
                };
                objJson.Data = objJS.Serialize(genericResult);
                objJson.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            }
            catch (Exception ex)
            {
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "getProductDetailList", "E", "admin");
            }
            return objJson;
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

    }
}