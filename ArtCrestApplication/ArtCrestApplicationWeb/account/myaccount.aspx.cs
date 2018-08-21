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
            if (Session["UserID"] == null)
            {
                Response.Redirect("/Login.aspx");
            }
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



        protected void btnProfileSave(object sender, EventArgs e)
        {
            lblErrorMsg.Text = "";
            try
            {
                if (validateProfileInput())
                {
                    Dictionary<string, string> parameters = new Dictionary<string, string>();                    
                    parameters.Add("uFirstName", uFirstName.Value);
                    parameters.Add("uLastName", uLastName.Value);
                    parameters.Add("uEmailID", uEmailID.Value);
                    parameters.Add("uMobNo", uMobileNo.Value);
                    parameters.Add("uModifyDate", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"));
                    parameters.Add("uModifyBy", "user");
                    string uGender = "";
                    if (genderMale.Checked)
                    {
                        uGender = "M";
                    }
                    else if (genderFemale.Checked)
                    {
                        uGender = "F";
                    }
                    else if (genderNotSpecified.Checked)
                    {
                        uGender = null;
                    }
                    parameters.Add("uGender", uGender);
                    parameters.Add("hdnUSerID",hdnUserID.Value);

                    string query = "UPDATE [dbo].[Users] SET [UserEmailID] = @uEmailID,[UserFirstName] = @uFirstName,[UserLastName] = @uLastName,[UserMobileNo] = @uMobNo,[UpdatedBy] = @uModifyBy,[UpdatedDate] = @uModifyDate,[UserGender] = @uGender WHERE UserID=@hdnUserID";

                    int updProfileResult = DataAccessLayer.DataAccessLayer.ExecuteNonQuery(query, parameters);
                    if (updProfileResult > 0)
                    {
                        ShowErrorMsg("Your profile was updated successfully", false);   
                    }
                    else
                    {
                        ShowErrorMsg("Oops! looks like there was some problem updating your profile", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ShowErrorMsg(ex.Message, true);
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "btnProfileSave", "E", "admin");
            }
        }



        protected void btnPasswordChange(object sender, EventArgs e)
        {
            lblErrorMsg.Text = "";
            try
            {
                if (validatePasswordChange())
                {
                    Dictionary<string, string> passParameters = new Dictionary<string, string>();
                    passParameters.Add("uPasswd", uNewPasswd.Value);
                    passParameters.Add("hdnUSerID", hdnUserID.Value);

                    string query = "UPDATE [dbo].[Users] SET [UserPassword] = @uPasswd WHERE UserID=@hdnUserID";

                    int passwdChangeResult = DataAccessLayer.DataAccessLayer.ExecuteNonQuery(query, passParameters);
                    if (passwdChangeResult > 0)
                    {
                        ShowErrorMsg("Your Password was changed successfully.", false);
                    }
                    else
                    {
                        ShowErrorMsg("Oops! Password cannot be changed due to unknow issue.", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ShowErrorMsg(ex.Message, true);
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "btnPasswordChange", "E", "admin");
            }
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

        public bool validateProfileInput()
        {
            bool result = true;
            if (uFirstName.Value == string.Empty || uLastName.Value == string.Empty || uEmailID.Value == string.Empty || uMobileNo.Value == string.Empty)
            {
                ShowErrorMsg("Please enter all required fields", true);
                result = false;
            }
            /*if (IsValidEmailAddress(uEmailID.Value) == false)
            {
                ShowErrorMsg("Please enter a valid Email ID.", true);
                result = false;
            }*/
            return result;
        }

        /*public bool IsValidEmailAddress(string email)
        {
            try
            {
                var emailChecked = new System.Net.Mail.MailAddress(email);
                return true;
            }
            catch
            {
                return false;
            }
        }*/

        public bool validatePasswordChange()
        {
            bool passResult = true;
            Dictionary<string, string> fetchUserCurrentPasswd = new Dictionary<string, string>();
            fetchUserCurrentPasswd.Add("userID", hdnUserID.Value);
            string fetchUserCurrentPasswdQuery = "select UserPassword from users where userid=@userID;";
            DataTable dtUserCurrentPasswd = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(fetchUserCurrentPasswdQuery, fetchUserCurrentPasswd);
            string uDBCurrentPasswd = Convert.ToString(dtUserCurrentPasswd.Rows[0]["UserPassword"]);

            if (uCurrentPasswd.Value != uDBCurrentPasswd)
            {
                ShowErrorMsg("Incorrect current password", true);
                passResult = false;
            }
            else if (uNewPasswd.Value != uConfirmNewPasswd.Value)
            {
                ShowErrorMsg("New Password did not match with Confirm password", true);
                passResult = false;
            }
            else
            {
                passResult = true;
            }
            return passResult;
        }

    }
}