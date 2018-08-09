using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Data;

namespace ArtCrestApplication.cart
{
    public partial class cart : System.Web.UI.Page
    {
        BusinessLayer.BusinessLayer objBusinessL = new BusinessLayer.BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("/Login.aspx");
            }
            if (Session["CartID"] != null && Session["CartID"].ToString() == "0")
            {
                lblEmptyCart.Visible = true;
                CartSection.Visible = false;
            }
        }

        [WebMethod]
        public static JsonResult getCartDetails()
        {
            JsonResult objJson = new JsonResult();
            JavaScriptSerializer objJS = new JavaScriptSerializer();
            try
            {
                cart objCart = new cart();
                DataSet dsCartDetails = objCart.getCartDetailsFromDB();
                string[] strResultArray = new string[5];
                if (dsCartDetails != null && dsCartDetails.Tables.Count > 0)
                {
                    var cartDetail = (from dt in dsCartDetails.Tables[0].AsEnumerable()
                                    select new
                                    {
                                        cCID = dt["CartID"],
                                        cUserID = dt["fkUserID"],
                                        cCStatus = dt["CartStatus"]                                       
                                    }).ToList();

                    strResultArray[0] = objJS.Serialize(cartDetail);

                    var cartItemDetails = (from dt in dsCartDetails.Tables[1].AsEnumerable()
                                             select new
                                             {
                                                 cCIID = dt["CartItemID"],
                                                 cCID = dt["fkCartID"],
                                                 cCIUserID = dt["fkUserID"],
                                                 cProductID = dt["fkProductID"],
                                                 cProdQuantity = dt["CartItemProductQuantity"],
                                                 cProductName = dt["ProductName"],
                                                 cProductPrice = (Convert.ToInt32(dt["ProductDiscountPrce"]) * Convert.ToInt32(dt["CartItemProductQuantity"])).ToString(),
                                                 cProductImage = dt["ImageLink1"] != DBNull.Value ? dt["ImageLink1"] : "item-01.jpg",
                                             }).ToList();

                    strResultArray[1] = objJS.Serialize(cartItemDetails);

                    var cartItemsSubTotal =  dsCartDetails.Tables[1].AsEnumerable()
                                            .Select(item => Convert.ToInt32(item["ProductDiscountPrce"]) * Convert.ToInt32(item["CartItemProductQuantity"]))
                                            .Sum().ToString();

                    strResultArray[2] = objJS.Serialize(cartItemsSubTotal);
                    strResultArray[3] = cartItemsSubTotal != null && Convert.ToInt32(cartItemsSubTotal) > 300 ? 0.ToString() : 30.ToString();
                    strResultArray[4] = (Convert.ToInt32(cartItemsSubTotal) + Convert.ToInt32(strResultArray[3])).ToString();

                }                
                var genericResult = new
                {
                    cDetail = strResultArray[0],
                    cIDetails = strResultArray[1],
                    cISubTotal = strResultArray[2],
                    cIShippingCharges = strResultArray[3],
                    cITotaAmount = strResultArray[4]
                };
                objJson.Data = objJS.Serialize(genericResult);
                objJson.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            }
            catch (Exception ex)
            {
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "getCartDetails", "E", "user");
            }
            return objJson;
        }

        public DataSet getCartDetailsFromDB(int CartID = 0, int UserID = 0)
        {
            DataSet dsCartDetail = new DataSet();
            try
            {
                dsCartDetail = objBusinessL.getCartDetailsFromDB(Convert.ToInt32(Session["CartID"]), Convert.ToInt32(Session["UserID"]));
            }
            catch (Exception ex)
            {
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "getCartDetailsFromDB", "E", UserID.ToString());
            }
            return dsCartDetail;
        }
    }
}