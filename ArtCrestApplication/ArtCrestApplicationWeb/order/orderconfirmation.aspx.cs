using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Data;

namespace ArtCrestApplicationWeb.order
{
    public partial class orderconfirmation : System.Web.UI.Page
    {
        BusinessLayer.BusinessLayer objBusinessL = new BusinessLayer.BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("/Login.aspx");
            }
        }

        [WebMethod]
        public static JsonResult getOrderConfirmationData(string orderID)
        {
            JsonResult objJson = new JsonResult();
            JavaScriptSerializer objJS = new JavaScriptSerializer();
            try
            {
                string[] strResultArray = new string[1];
                orderconfirmation objOrderConfirmation = new orderconfirmation();
                DataTable dtOrderConfirmationDetails = objOrderConfirmation.getOrderDetails(Convert.ToInt32(orderID));
                if (dtOrderConfirmationDetails != null && dtOrderConfirmationDetails.Rows.Count > 0)
                {
                    var orderDetails = (from dt in dtOrderConfirmationDetails.AsEnumerable()
                                       select new
                                       {
                                           oID = dt["OrderID"],
                                           pID = dt["fkProductID"],
                                           oExpectedDeliveryDate = dt["expectedDeliveryDate"],
                                           oCustomerName = dt["UserDetailFirstName"],
                                           uDmob = dt["UserDetailMobileNo"],
                                           uDAddress = dt["UserDetailAddressLine1"],
                                           uDAreaLocality = dt["UserDetailAddressLine2"],
                                           uDLandmark = dt["UserDetailLandmark"],
                                           uDPinCode = dt["UserDetailPinCode"],
                                           uDCity = dt["UserDetailCityName"],
                                           uDState = dt["UserDetailStateName"],
                                           oImageLink1 = dt["ImageLink1"],
                                           oProductName = dt["ProductName"],
                                           oProductQuantity = dt["ProductQuantity"],
                                           oItemFinalPrice = dt["OrderItemFinalPrice"],
                                           oTotalAmount = dt["TotalAmount"]
                                       }).ToList();

                    strResultArray[0] = objJS.Serialize(orderDetails);
                }

                var genericResult = new
                {
                    orderDetails = strResultArray[0]
                };
                objJson.Data = objJS.Serialize(genericResult);
                objJson.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            }
            catch (Exception ex)
            {
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "getOrderConfirmationData", "E", "user");
            }
            return objJson;
        }

        public DataTable getOrderDetails(int OrderID)
        {
            Dictionary<string, string> fetchOrderDetailsParameters = new Dictionary<string, string>();
            fetchOrderDetailsParameters.Add("fkOrderID", Convert.ToInt32(OrderID).ToString());
            fetchOrderDetailsParameters.Add("fkUserID", Convert.ToInt32(Session["UserID"]).ToString());
            string fetchOrderDetailQuery = "select *,convert(varchar, oi.OrderDeliveryDate, 107) as expectedDeliveryDate from [order] o inner join orderitem oi on o.OrderID = oi.fkOrderID " + 
                                        " inner join UserDetail ud on o.fkUserDetailAddressID = ud.UserDetailID "+
                                        " left join productimage pimg on oi.fkProductID = pimg.fkProductID "+
                                        " where o.orderID = @fkOrderID and o.isCancelled = 0 and oi.isCancelled = 0 and o.fkUserID = @fkUserID;";
            DataTable dtOrderDetails = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(fetchOrderDetailQuery, fetchOrderDetailsParameters);
            return dtOrderDetails;
        }
    }
}