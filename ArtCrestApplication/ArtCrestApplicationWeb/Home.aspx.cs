﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtCrestApplication
{
    public partial class Home : System.Web.UI.Page
    {
        BusinessLayer.BusinessLayer objBusinessL = new BusinessLayer.BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            hdnUserID.Value = Session["UserID"] != null ? Session["UserID"].ToString() : "0";
        }

        public DataTable getProducts()
        {
            Dictionary<string, string> fetchProductParameters = new Dictionary<string, string>();
            fetchProductParameters.Add("isActive", true.ToString());
            string fetchProductQuery = "select * from product left join productimage pimg on Product.ProductID = pimg.fkProductID where IsActive = @isActive and productQuantity > 0;";
            DataTable dtProducts = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(fetchProductQuery, fetchProductParameters);
            return dtProducts;
        }

        public DataTable getSubCategories()
        {
            Dictionary<string, string> fetchProductParameters = new Dictionary<string, string>();
            fetchProductParameters.Add("isActive", true.ToString());
            string fetchProductQuery = "select * from productsubcategory where IsActive = @isActive;";
            DataTable dtProducts = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(fetchProductQuery, fetchProductParameters);
            return dtProducts;
        }

        [WebMethod]
        public static JsonResult getProductList()
        {
            JsonResult objJson = new JsonResult();
            JavaScriptSerializer objJS = new JavaScriptSerializer();
            try
            {
                Home objHome = new Home();
                DataTable dtProducts = objHome.getProducts();
                DataTable dtSubCategories = objHome.getSubCategories();
                string[] strResultArray = new string[2];
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
                if (dtSubCategories != null && dtSubCategories.Rows.Count > 0)
                {
                    var SubCategoriesList = (from dt in dtSubCategories.AsEnumerable()
                                             select new
                                             {
                                                 pSID = dt["ProductSubCategoryID"],
                                                 pSName = dt["ProductSubCategoryName"]
                                             }).ToList();

                    strResultArray[1] = objJS.Serialize(SubCategoriesList);
                }

                var genericResult = new
                {
                    ProductList = strResultArray[0],
                    ProductSubCatList = strResultArray[1]
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
        public static JsonResult addToCart(string productID, string userID)
        {
            JsonResult objJson = new JsonResult();
            JavaScriptSerializer objJS = new JavaScriptSerializer();
            try
            {
                Home objHome = new Home();
                DataSet dsData = objHome.ActualAddCart(Convert.ToInt32(productID));                
                string[] strResultArray = new string[2];
                if (dsData != null && dsData.Tables.Count > 0)
                {
                    strResultArray[0] = objJS.Serialize(dsData.Tables[1].Rows.Count.ToString());
                }              

                var genericResult = new
                {
                    CartItemCount = strResultArray[0]                    
                };
                objJson.Data = objJS.Serialize(genericResult);
                objJson.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            }
            catch (Exception ex)
            {
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "addToCart", "E", userID);
            }
            return objJson;
        }

        public DataSet ActualAddCart(int productID)
        {
            DataSet dsData = new DataSet();
            dsData = objBusinessL.AddToCart(productID, Convert.ToInt32(Session["UserID"]), 1, Convert.ToInt32(Session["CartID"]));
            Login objLogin = new Login();
            objLogin.FetchCartIDAndCartItemID(0, Convert.ToInt32(Session["UserID"]));            
            return dsData;
        }

        [WebMethod]
        public static JsonResult fetchItemCount()
        {
            JsonResult objJson = new JsonResult();
            JavaScriptSerializer objJS = new JavaScriptSerializer();
            try
            {
                Home objHome = new Home();
                DataTable dtItemCount = objHome.FetchCartIDAndCartItemID();
                string[] strResultArray = new string[2];
                if (dtItemCount != null && dtItemCount.Rows.Count > 0)
                {
                    strResultArray[0] = objJS.Serialize(dtItemCount.Rows[0]["CartItemCount"]);
                }
                else
                {
                    strResultArray[0] = objJS.Serialize("0");
                }

                var genericResult = new
                {
                    CartItemCount = strResultArray[0]
                };
                objJson.Data = objJS.Serialize(genericResult);
                objJson.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            }
            catch (Exception ex)
            {
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "fetchItemCount", "E", "user");
            }
            return objJson;
        }
        public DataTable FetchCartIDAndCartItemID()
        {
            DataTable dtCartIDAndCartItemCount = new DataTable();
            if (Session["UserID"] != null)
            {
                dtCartIDAndCartItemCount = objBusinessL.GetCartIDAndCartItemCount(Convert.ToInt32(Session["UserID"].ToString()), 0);
                if (dtCartIDAndCartItemCount != null && dtCartIDAndCartItemCount.Rows.Count > 0)
                {
                    Session["CartID"] = Convert.ToString(dtCartIDAndCartItemCount.Rows[0]["CartID"]);
                    Session["CartItemCount"] = Convert.ToString(dtCartIDAndCartItemCount.Rows[0]["CartItemCount"]);
                }
                else
                {
                    Session["CartItemCount"] = "0";
                }

            }
            return dtCartIDAndCartItemCount;
        }

    }
}