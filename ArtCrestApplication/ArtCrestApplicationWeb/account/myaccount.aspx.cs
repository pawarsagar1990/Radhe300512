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

namespace ArtCrestApplicationWeb.account
{
    public partial class myaccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hdnUserID.Value = Session["UserID"] != null ? Session["UserID"].ToString() : "0";
        }
        public DataTable getUserDetails(string userID)
        {
            Dictionary<string, string> fetchUserDetails = new Dictionary<string, string>();
            fetchUserDetails.Add("userID", userID);
            string fetchUserQuery = "select * from users where userid=@userID;";
            DataTable dtUserDetails = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(fetchUserQuery, fetchUserDetails);
            return dtUserDetails;
        }

        [WebMethod]
        public static JsonResult getUserDetailList(string userID)
        {
            int hdnUserID = Convert.ToInt32(userID);
            JsonResult objJson = new JsonResult();
            JavaScriptSerializer objJS = new JavaScriptSerializer();
            try
            {
                myaccount objuserdetail = new myaccount();
                DataTable dtUsers = objuserdetail.getUserDetails(hdnUserID.ToString());
                string[] strResultArray = new string[1];
                if (dtUsers != null && dtUsers.Rows.Count > 0)
                {
                    var UserDetailList = (from dt in dtUsers.AsEnumerable()
                                          select new
                                          {
                                              uID = dt["UserID"],
                                              uEmailID = dt["UserEmailID"],
                                              uPassword= dt["UserPassword"],
                                              uFisrtName = dt["UserFirstName"],
                                              uLastName = dt["UserLastName"],
                                              uMobileNo = dt["UserMobileNo"],
                                              uGender = dt["UserGender"]
                                          }).ToList();

                    strResultArray[0] = objJS.Serialize(UserDetailList);
                }

                var genericResult = new
                {
                    UserDetailList = strResultArray[0],
                };
                objJson.Data = objJS.Serialize(genericResult);
                objJson.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            }
            catch (Exception ex)
            {
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "getUserDetailList", "E", "admin");
            }
            return objJson;
        }

    }
}