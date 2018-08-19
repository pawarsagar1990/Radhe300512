﻿using System;
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

        public DataSet actualConfirmOrder(string address)
        {            
            DataSet dsOrderAndOrderItem = objBusinessL.CreateConfirmOrder(Convert.ToInt32(Session["UserID"].ToString()), Convert.ToInt32(Session["CartID"].ToString()), Convert.ToInt32(address));
            if (dsOrderAndOrderItem != null && dsOrderAndOrderItem.Tables.Count > 0 && dsOrderAndOrderItem.Tables[0].Rows.Count > 0)
            { Session["CartID"] = "0"; sendOrderConfirmationEmail(dsOrderAndOrderItem); }  //means order successfully created.
            return dsOrderAndOrderItem;
        }

        public void sendOrderConfirmationEmail(DataSet dtOrderConfirmation)
        {
            string mailSubject = "Your Skartif.com order of "+ dtOrderConfirmation.Tables[1].Rows[0]["ProductName"].ToString() + " is successfully placed.";
            StringBuilder mailBody = new StringBuilder();
            mailBody.Append("<b>Congratulations! Your order has been placed successfully. <br/> Your order number is "+ dtOrderConfirmation.Tables[1].Rows[0]["fkOrderID"].ToString() + ".<br/>");
            mailBody.Append("Thank you for your order. We’ll send a confirmation when your order ships.</b><br/>");
            mailBody.Append("<table style='border:1px;border-style:solid;'><th>Product Name</th><th>Quantity</th><th>Price</th><tbody>");
            foreach (var dt in dtOrderConfirmation.Tables[1].AsEnumerable())
            {
                mailBody.Append("<tr><td>"+ dt["ProductName"].ToString() + "</td><td>" + dt["ProductQuantity"].ToString() + "</td><td>&#8377; " + dt["OrderItemFinalPrice"].ToString() + "</td></tr>");
            }
            mailBody.Append("<tr><td></td><td>Total Amount</td><td>&#8377; " + dtOrderConfirmation.Tables[0].Rows[0]["TotalAmount"].ToString() + "</td></tr>");
            mailBody.Append("</tbody></table>");
            mailBody.Append("<br/><br/><br/> Thank You.<br/>Skartif Team.");

            objBusinessL.SendMail(Session["UserEmailID"].ToString(), mailSubject, mailBody.ToString());
        }



    }
}