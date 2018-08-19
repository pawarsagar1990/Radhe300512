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

namespace ArtCrestApplication.checkout
{
    public partial class checkout : System.Web.UI.Page
    {
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
        public static JsonResult confirmOrder()
        {
            JsonResult objJson = new JsonResult();
            JavaScriptSerializer objJS = new JavaScriptSerializer();
            try
            {
                string[] strResultArray = new string[1];
                checkout objCheckout = new checkout();
                DataSet dtOrderAndOrderItem = objCheckout.actualConfirmOrder();
                if (dtOrderAndOrderItem != null && dtOrderAndOrderItem.Tables.Count > 0)
                {
                    var orderDetail = (from dt in dtOrderAndOrderItem.Tables[0].AsEnumerable()
                                       select new
                                       {
                                           oOID = dt["OrderID"],                                           
                                       }).ToList();

                    strResultArray[0] = objJS.Serialize(orderDetail);
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

        public DataSet actualConfirmOrder()
        {
            BusinessLayer.BusinessLayer objBusinessL = new BusinessLayer.BusinessLayer();
            DataSet dsOrderAndOrderItem = objBusinessL.CreateConfirmOrder(Convert.ToInt32(Session["UserID"].ToString()), Convert.ToInt32(Session["CartID"].ToString()));
            return dsOrderAndOrderItem;
        }
    }
}