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
    public partial class products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hdnSubCatID.Value = "";
            string subCatID = Request.QueryString["scid"] != null ? Convert.ToString(Request.QueryString["scid"]) : "";
            if (subCatID != "")
            {
                hdnSubCatID.Value = subCatID;
            };

            hdnSearchAlias.Value = "";
            string searchString = Request.QueryString["ss"] != null ? Convert.ToString(Request.QueryString["ss"]) : "";
            if (searchString != "")
            {
                hdnSearchAlias.Value = searchString;
            };
            hdnUserID.Value = Session["UserID"] != null ? Session["UserID"].ToString() : "0";
        }


        public DataTable getCategoryNames()
        {
            Dictionary<string, string> fetchCategoryParameters = new Dictionary<string, string>();
            fetchCategoryParameters.Add("isActive", true.ToString());
            string fetchCategoryQuery = "select * from ProductSubCategory where IsActive = @isActive";
            DataTable dtProducts = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(fetchCategoryQuery, fetchCategoryParameters);
            return dtProducts;
        }


        public DataTable getProductDetails(string catID)
        {
            Dictionary<string, string> fetchProductDetailParameters = new Dictionary<string, string>();
            fetchProductDetailParameters.Add("catID", catID);
            fetchProductDetailParameters.Add("isActive", true.ToString());
            string fetchProductQuery = "select * from product left join productimage pimg on Product.ProductID = pimg.fkProductID where fkproductsubcategoryid=@catID and IsActive = @isActive and productQuantity > 0;";
            if (Convert.ToInt32(catID) == 0)
            {
                fetchProductQuery = "select * from product left join productimage pimg on Product.ProductID = pimg.fkProductID where IsActive = @isActive and productQuantity > 0;";
            }
            DataTable dtProducts = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(fetchProductQuery, fetchProductDetailParameters);
            return dtProducts;
        }

        public DataTable getProductSearchDetails(string searchAlias)
        {
            Dictionary<string, string> fetchProductSearchParameters = new Dictionary<string, string>();
            fetchProductSearchParameters.Add("searchAlias", searchAlias);
            fetchProductSearchParameters.Add("isActive", true.ToString());
            string fetchProductSearchQuery = "select * from product left join productimage pimg on Product.ProductID = pimg.fkProductID where productsearchalias like '%' + @searchAlias + '%' and IsActive = @isActive and productQuantity > 0;";
            DataTable dtProducts = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(fetchProductSearchQuery, fetchProductSearchParameters);
            return dtProducts;
        }


        [WebMethod]
        public static JsonResult getCategoryList()
        {
            JsonResult objJson = new JsonResult();
            JavaScriptSerializer objJS = new JavaScriptSerializer();
            try
            {
                products objcategoryDetail = new products();
                DataTable dtCategory = objcategoryDetail.getCategoryNames();
                string[] strResultArray = new string[1];
                if (dtCategory != null && dtCategory.Rows.Count > 0)
                {
                    var ProdCategoryList = (from dt in dtCategory.AsEnumerable()
                                            select new
                                            {
                                                pCatID = dt["ProductSubCategoryId"],
                                                pCatName = dt["ProductSubCategoryName"]
                                            }).ToList();

                    strResultArray[0] = objJS.Serialize(ProdCategoryList);
                }

                var genericResult = new
                {
                    ProductCategoryList = strResultArray[0],
                };
                objJson.Data = objJS.Serialize(genericResult);
                objJson.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            }
            catch (Exception ex)
            {
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "getCategoryList", "E", "admin");
            }
            return objJson;
        }


        [WebMethod]
        public static JsonResult getProductList(string catID)
        {
            JsonResult objJson = new JsonResult();
            JavaScriptSerializer objJS = new JavaScriptSerializer();
            try
            {
                int hdnSubCatID = Convert.ToInt32(catID);
                products objrelatedProduct = new products();
                DataTable dtProducts = objrelatedProduct.getProductDetails(hdnSubCatID.ToString());
                string[] strResultArray = new string[1];
                if (dtProducts != null && dtProducts.Rows.Count > 0)
                {
                    var ProdList = (from dt in dtProducts.AsEnumerable()
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
                                        pImageLink = dt["ImageLink1"] != DBNull.Value ? dt["ImageLink1"] : "item-01.jpg",
                                        pProdSubCategoryID = dt["fkProductSubCategoryID"]
                                    }).ToList();

                    strResultArray[0] = objJS.Serialize(ProdList);
                }

                var genericResult = new
                {
                    ProductList = strResultArray[0],
                };
                objJson.Data = objJS.Serialize(genericResult);
                objJson.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            }
            catch (Exception ex)
            {
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "getProductList", "E", "admin");
            }
            return objJson;
        }


        [WebMethod]
        public static JsonResult getProductSearchList(string searchAlias)
        {
            JsonResult objJson = new JsonResult();
            JavaScriptSerializer objJS = new JavaScriptSerializer();
            try
            {
                string hdnSearchAlias = Convert.ToString(searchAlias);
                products objSearchProduct = new products();
                DataTable dtSearchProducts = objSearchProduct.getProductSearchDetails(hdnSearchAlias.ToString());
                string[] strResultArray = new string[1];
                if (dtSearchProducts != null && dtSearchProducts.Rows.Count > 0)
                {
                    var ProdSearchList = (from dt in dtSearchProducts.AsEnumerable()
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
                                        pImageLink = dt["ImageLink1"] != DBNull.Value ? dt["ImageLink1"] : "item-01.jpg",
                                        pProdSubCategoryID = dt["fkProductSubCategoryID"]
                                    }).ToList();

                    strResultArray[0] = objJS.Serialize(ProdSearchList);
                }

                var genericResult = new
                {
                    ProductSearchList = strResultArray[0],
                };
                objJson.Data = objJS.Serialize(genericResult);
                objJson.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            }
            catch (Exception ex)
            {
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "getProductSearchList", "E", "admin");
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