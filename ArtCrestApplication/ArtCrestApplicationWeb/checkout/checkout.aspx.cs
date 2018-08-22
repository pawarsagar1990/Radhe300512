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
using System.Text;

namespace ArtCrestApplication.checkout
{
    public partial class checkout : System.Web.UI.Page
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
        public static JsonResult getState()
        {
            JsonResult objJson = new JsonResult();
            JavaScriptSerializer objJS = new JavaScriptSerializer();
            try
            {
                BusinessLayer.BusinessLayer objBL = new BusinessLayer.BusinessLayer();
                DataTable dtState = objBL.getDataFromQuery("select * from state;");
                string[] strResultArray = new string[1];
                if (dtState != null && dtState.Rows.Count > 0)
                {
                    var stateList = (from dt in dtState.AsEnumerable()
                                             select new
                                             {
                                                 sID = dt["StateID"],
                                                 sName = dt["StateName"]
                                             }).ToList();

                    strResultArray[0] = objJS.Serialize(stateList);
                }

                var genericResult = new
                {
                    stateList = strResultArray[0]
                };
                objJson.Data = objJS.Serialize(genericResult);
                objJson.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            }
            catch (Exception ex)
            {
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "getState", "E", "user");
            }
            return objJson;
        }

        [WebMethod]
        public static JsonResult saveAddress(string name, string mobileID, string address, string pinCode, string areaLocality, string landMark, string city, string stateID, string stateName)
        {
            JsonResult objJson = new JsonResult();
            JavaScriptSerializer objJS = new JavaScriptSerializer();
            try
            {
                checkout objCheckout = new checkout();
                string[] strResultArray = new string[1];
                if (objCheckout.saveActualAddress(name, mobileID, address, pinCode, areaLocality, landMark, city, stateID, stateName))
                {
                    strResultArray[0] = "true";
                }
                else { strResultArray[0] = "false"; }
                var genericResult = new
                {
                    successAddressSave = strResultArray[0]
                };
                objJson.Data = objJS.Serialize(genericResult);
                objJson.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            }
            catch (Exception ex)
            {
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "addToCart", "E", "userID");
            }
            return objJson;
        }

        public bool saveActualAddress(string name, string mobileID, string address, string pinCode, string areaLocality, string landMark, string city, string stateID, string stateName)
        {
            bool isSuccess = false;
            try
            {
                Dictionary<string, string> parameters = new Dictionary<string, string>();
                parameters.Add("uFkUserID", Convert.ToString(Session["UserID"]));
                parameters.Add("uName", name);
                parameters.Add("uMobile", mobileID);
                parameters.Add("uAddress", address);
                parameters.Add("uPinCode", pinCode);
                parameters.Add("uareaLocality", areaLocality);
                parameters.Add("ulandMark", landMark);
                parameters.Add("uCity", city);
                parameters.Add("uStateID", stateID);
                parameters.Add("uStateName", stateName);
                parameters.Add("uIsActive", true.ToString());
                parameters.Add("pCreatedBy", Session["UserID"].ToString());
                parameters.Add("pCreatedDate", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"));
                parameters.Add("pUpdatedBy", Session["UserID"].ToString());
                parameters.Add("pUpdatedDate", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"));

                string query = "INSERT INTO[dbo].[UserDetail]([fkUserID],[UserDetailFirstName],[UserDetailMobileNo]," +
                                "[UserDetailAddressLine1], UserDetailAddressLine2, [UserDetailLandmark],[UserDetailPinCode],[UserDetailStateID],[UserDetailCountryID],[IsActive]"
                                + ",[UserDetailCityName],[UserDetailStateName],[CreatedBy],[CreatedDate],[UpdatedBy],[UpdatedDate])VALUES" +
                                "(@uFkUserID,@uName, @uMobile,@uAddress, @uareaLocality, @ulandMark,@uPinCode,@uStateID,'1',@uIsActive,@uCity,@uStateName,@pCreatedBy,@pCreatedDate,@pUpdatedBy,@pUpdatedDate);";

                int insertResult = DataAccessLayer.DataAccessLayer.ExecuteNonQuery(query, parameters);
                if (insertResult > 0)
                { isSuccess = true; }
            }
            catch (Exception ex)
            {
                isSuccess = false;
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "saveActualAddress", "E", Convert.ToString(Session["UserID"]));
            }
          
            return isSuccess;
        }

        [WebMethod]
        public static JsonResult getUserAddresses()
        {
            JsonResult objJson = new JsonResult();
            JavaScriptSerializer objJS = new JavaScriptSerializer();
            try
            {                
                string[] strResultArray = new string[1];
                checkout objCheckout = new checkout();
                DataTable dtUserAddresses = objCheckout.getuserAddress();
                if (dtUserAddresses != null && dtUserAddresses.Rows.Count > 0)
                {
                    var addressList = (from dt in dtUserAddresses.AsEnumerable()
                                     select new
                                     {
                                         uDID = dt["UserDetailID"],
                                         uUID = dt["fkUserID"],
                                         uDName = dt["UserDetailFirstName"],
                                         uDmob = dt["UserDetailMobileNo"],
                                         uDAddress = dt["UserDetailAddressLine1"],
                                         uDAreaLocality = dt["UserDetailAddressLine2"],                                         
                                         uDLandmark = dt["UserDetailLandmark"],
                                         uDPinCode = dt["UserDetailPinCode"],
                                         uDCity = dt["UserDetailCityName"],
                                         uDState = dt["UserDetailStateName"],
                                         uDStateID = dt["UserDetailStateID"]
                                     }).ToList().OrderByDescending(a=>a.uDID);

                    strResultArray[0] = objJS.Serialize(addressList);
                }

                var genericResult = new
                {
                    addressList = strResultArray[0]
                };
                objJson.Data = objJS.Serialize(genericResult);
                objJson.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            }
            catch (Exception ex)
            {
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "getUserAddresses", "E", "user");
            }
            return objJson;
        }

        public DataTable getuserAddress()
        {
            BusinessLayer.BusinessLayer objBL = new BusinessLayer.BusinessLayer();
            DataTable dtUserAddresses = objBL.getDataFromQuery("select * from userdetail where fkuserid =" + Session["UserID"].ToString());
            return dtUserAddresses;
        }

        //protected void btnConfirmOrder_Click(object sender, EventArgs e) {

        //    string addre = selectedAddress.Value;
        //}
        [WebMethod]
        public static JsonResult confirmOrder(string address)
        {
            JsonResult objJson = new JsonResult();
            JavaScriptSerializer objJS = new JavaScriptSerializer();
            try
            {
                string[] strResultArray = new string[1];
                checkout objCheckout = new checkout();
                DataSet dtOrderAndOrderItem = objCheckout.actualConfirmOrder(address);
                if (dtOrderAndOrderItem != null && dtOrderAndOrderItem.Tables.Count > 0)
                {
                    if (dtOrderAndOrderItem.Tables[0].Rows.Count > 0)
                    {
                        var orderDetail = (from dt in dtOrderAndOrderItem.Tables[0].AsEnumerable()
                                           select new
                                           {
                                               oOID = dt["OrderID"],
                                           }).ToList();

                        strResultArray[0] = objJS.Serialize(orderDetail);
                    }
                    else if (dtOrderAndOrderItem.Tables[2].Rows.Count > 0)
                    {
                        var errorDetail = (from dt in dtOrderAndOrderItem.Tables[2].AsEnumerable()
                                           select new
                                           {
                                               errorMessage = dt["ErrorMessage"],
                                           }).ToList();

                        strResultArray[0] = objJS.Serialize(errorDetail);
                    }
                }

                var genericResult = new
                {
                    orderDetail = strResultArray[0]
                };
                objJson.Data = objJS.Serialize(genericResult);
                objJson.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            }
            catch (Exception ex)
            {
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "confirmOrder", "E", "user");
            }
            return objJson;
        }

        public DataSet actualConfirmOrder(string address)
        {            
            DataSet dsOrderAndOrderItem = objBusinessL.CreateConfirmOrder(Convert.ToInt32(Session["UserID"].ToString()), Convert.ToInt32(Session["CartID"].ToString()), Convert.ToInt32(address));
            if (dsOrderAndOrderItem != null && dsOrderAndOrderItem.Tables.Count > 0 && dsOrderAndOrderItem.Tables[0].Rows.Count > 0)
            { Session["CartID"] = "0"; sendOrderConfirmationEmail(dsOrderAndOrderItem); }  //means order successfully created.
            return dsOrderAndOrderItem;
        }

        public void sendOrderConfirmationEmail(DataSet dtOrderConfirmation)
        {
            string mailSubject = "";
            if (dtOrderConfirmation.Tables[1].Rows.Count>1)
            {
                var otherproductcount = (dtOrderConfirmation.Tables[1].Rows.Count - 1);
                mailSubject = "Your Skartif.com order of " + dtOrderConfirmation.Tables[1].Rows[0]["ProductName"].ToString() + " and " + otherproductcount + " other products is successfully placed.";
            }
            else
            {
                mailSubject = "Your Skartif.com order of " + dtOrderConfirmation.Tables[1].Rows[0]["ProductName"].ToString() + " is successfully placed.";
            }
            
            StringBuilder mailBody = new StringBuilder();
            mailBody.Append("<!DOCTYPE html><html><head><link rel='stylesheet' type='text/css' href='http://skartif.com/vendor/bootstrap/css/bootstrap.min.css'/></head>");
            mailBody.Append("<body><div class='container' style='padding-bottom:20px;'><div style = 'width:30%;display:inline-block;'><img src='http://skartif.com/images/icons/logo.png' style='width:80%;padding:20px;'/></div><div style = 'width:30%;display:inline-block;padding:20px;vertical-align:middle;text-align:center;font-family:Verdana;font-size:24px;color:#3c9bed;'> Order Confirmation</div><div style = 'width:30%;display:inline-block;padding:20px;vertical-align:middle;text-align:center;font-family:Verdana;font-size:12px;color:#3c9bed;'> info@skartif.com</div><hr />");
            mailBody.Append("<div><span style = 'color:#1f0a50;font-weight:bold;'> Dear Customer,</span><br /><p> Thank you for your order with skartif.com.Estimated date for your order delivery is mentioned below.You may track your order from skartif.com my orders section.</p></div><hr />");
            mailBody.Append("<div><span> Estimated Date of Delivery: " + dtOrderConfirmation.Tables[1].Rows[0]["EstimatedDeliveryDate"].ToString() + "</span></div><hr />");
            mailBody.Append("<div><span style = 'color:#1f0a50;font-weight:bold;'> Order Details </span></div><div><span style = 'color:#1f0a50;font-weight:bold;'> ORD" + dtOrderConfirmation.Tables[0].Rows[0]["OrderID"].ToString() + " </span></div><hr />");

            foreach (var dt in dtOrderConfirmation.Tables[1].AsEnumerable())
            {
                mailBody.Append("<div style='verticle-align:middle;'><div style = 'max-width:30%;display:inline-block;padding:10px;'><img src = 'http://skartif.com/productimages/" + dt["fkProductID"].ToString() + ".1.jpg' style = 'width:100px;' /></div><div style = 'width:45%;display:inline-block;padding:10px;' ><span> " + dt["ProductName"].ToString() + "</span></div><div style = 'width:18%;display:inline-block;padding:10px;' ><span> Rs. " + dt["OrderItemFinalPrice"].ToString() + " </span></div><hr /></div>");
            }

            mailBody.Append("<div style = 'text-align:right;color:#3c9bed;'><div><span> Subtotal: Rs. " + dtOrderConfirmation.Tables[0].Rows[0]["SubTotal"].ToString() + " </span></div><div><span> Shipping: Rs. " + dtOrderConfirmation.Tables[0].Rows[0]["ShippingCharge"].ToString() + "</span></div><div><span> Total Amount: Rs." + dtOrderConfirmation.Tables[0].Rows[0]["TotalAmount"].ToString() + " </span></div></div><hr />");
            mailBody.Append("<div><span> We hope you had awesome experience with skartif.com and hope to see you again soon.</span></div><div><span style = 'color:#1f0a50;font-weight:bold;text-decoration:none;'> skartif.com </span></div></div></body></html>");

                        objBusinessL.SendMail(Session["UserEmailID"].ToString(), mailSubject, mailBody.ToString());
        }

        public bool checkIfValidPincode(string address)
        {
            bool isValidPincode = false;
            Dictionary<string, string> fetchPinCodeDetails = new Dictionary<string, string>();
            fetchPinCodeDetails.Add("isActive", true.ToString());
            fetchPinCodeDetails.Add("userDetailID", Convert.ToInt32(address).ToString());
            string fetchProductQuery = "select * from UserDetail ud inner join Pincode pc on ud.UserDetailPinCode = pc.pincode " 
                                        + "where ud.UserDetailID = @userDetailID and ud.IsActive = @isActive and pc.IsActive = @isActive;";
            DataTable dtPinCode = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(fetchProductQuery, fetchPinCodeDetails);
            if(dtPinCode != null && dtPinCode.Rows.Count > 0)
            {
                isValidPincode = true;
            }
            return isValidPincode;
        }

        [WebMethod]
        public static JsonResult checkValidPincode(string address)
        {
            JsonResult objJson = new JsonResult();
            JavaScriptSerializer objJS = new JavaScriptSerializer();
            try
            {
                string[] strResultArray = new string[1];
                checkout objCheckout = new checkout();
                if (objCheckout.checkIfValidPincode(address))
                {
                    strResultArray[0] = objJS.Serialize(true.ToString());
                }
                else
                {
                    strResultArray[0] = objJS.Serialize(false.ToString());
                }
                var genericResult = new
                {
                    checkValidPincode = strResultArray[0]
                };
                objJson.Data = objJS.Serialize(genericResult);
                objJson.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            }
            catch (Exception ex)
            {
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "checkValidPincode", "E", "user");
            }
            return objJson;
        }

    }
}