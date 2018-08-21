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

namespace ArtCrestApplicationWeb.order
{
    public partial class orderhistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("/Login.aspx");
            }
            hdnUserID.Value = Session["UserID"] != null ? Session["UserID"].ToString() : "0";
        }


        public DataTable getOrders(string userID)
        {
            Dictionary<string, string> fetchOrderParameters = new Dictionary<string, string>();
            fetchOrderParameters.Add("userID", userID);
            string fetchOrdersQuery = "select *,convert(varchar, CreatedDate, 107) as orderDate from [order] where fkuserid=@userID;";
            DataTable dtOrders = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(fetchOrdersQuery, fetchOrderParameters);
            return dtOrders;
        }

        public DataTable getOrderItems(string userID)
        {
            Dictionary<string, string> fetchOrderItemParameters = new Dictionary<string, string>();
            fetchOrderItemParameters.Add("userID", userID);
            string fetchOrderItemsQuery = "select *,convert(varchar, oi.orderActualDeliveryDate, 107) as deliveryDate from OrderItem oi,[order] o, product p, ProductImage pi where o.OrderID=oi.fkOrderID and oi.fkProductID=p.ProductID and p.ProductID=pi.fkProductID and o.fkUserID=@userID;";
            DataTable dtOrderItems = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(fetchOrderItemsQuery, fetchOrderItemParameters);
            return dtOrderItems;
        }


        [WebMethod]
        public static JsonResult getOrderList(string userID)
        {
            JsonResult objJson = new JsonResult();
            JavaScriptSerializer objJS = new JavaScriptSerializer();
            try
            {
                int hdnUserID = Convert.ToInt32(userID);
                orderhistory objHome = new orderhistory();
                DataTable dtOrders = objHome.getOrders(hdnUserID.ToString());
                DataTable dtOrderItems = objHome.getOrderItems(hdnUserID.ToString());
                string[] strResultArray = new string[2];
                if (dtOrders != null && dtOrders.Rows.Count > 0)
                {
                    var OrderList = (from dt in dtOrders.AsEnumerable()
                                    select new
                                    {
                                        oID = dt["OrderID"],
                                        OCancelFlag = dt["isCancelled"],
                                        oSubTot = dt["SubTotal"],
                                        oShipCharge = dt["ShippingCharge"],
                                        oTotalAmt = dt["TotalAmount"],
                                        oDelAddress = dt["fkUserDetailAddressID"],
                                        oCreatedDate = dt["orderDate"]
                                    }).ToList();

                    strResultArray[0] = objJS.Serialize(OrderList);
                }
                if (dtOrderItems != null && dtOrderItems.Rows.Count > 0)
                {
                    var OrderItemsList = (from dt in dtOrderItems.AsEnumerable()
                                          select new
                                          {
                                              pPID = dt["ProductID"],
                                              pPName = dt["ProductName"],
                                              pImageLink = dt["ImageLink1"] != DBNull.Value ? dt["ImageLink1"] : "item-01.jpg",
                                              oID = dt["fkOrderID"],
                                              opQuantity = dt["ProductQuantity"],
                                              opBasePrice = dt["ProductBasePrice"],
                                              opmarginper = dt["ACMarginPercent"],
                                              opCGST = dt["CGSTPercent"],
                                              opSGST = dt["SGSTPercent"],
                                              opDiscPer = dt["DiscountPercent"],
                                              opSellPrice = dt["ProductSellPrice"],
                                              opProdDiscPrice = dt["ProductDiscountPrice"],
                                              opFinalPrice = dt["OrderItemFinalPrice"],
                                              otStatus = dt["OrderStatus"],
                                              otDeliveryDate = dt["deliveryDate"],
                                              otCancelFlag = dt["isCancelled"],
                                              opProdName = dt["ProductName"]

                                          }).ToList();

                    strResultArray[1] = objJS.Serialize(OrderItemsList);
                }
                
                var genericResult = new
                {
                    OrderList = strResultArray[0],
                    OrderItemsLits = strResultArray[1]
                };
                objJson.Data = objJS.Serialize(genericResult);
                objJson.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            }
            catch (Exception ex)
            {
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "getOrderList", "E", "admin");
            }
            return objJson;
        }


    }
}