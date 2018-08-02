using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
using DataAccessLayer;

namespace ArtCrestApplication
{
    public partial class forgotpassword : System.Web.UI.Page
    {
        BusinessLayer.BusinessLayer objBusinessL = new BusinessLayer.BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            changePasswordDiv.Visible = false;
            sendLinkDiv.Visible = true;
            string verificationGUID = Request.QueryString["uid"] != null ? Convert.ToString(Request.QueryString["uid"]) : "";
            if (verificationGUID != "")
            {
                if (checkIfValidGUID(verificationGUID))
                {
                    changePasswordDiv.Visible = true;
                    sendLinkDiv.Visible = false;
                }
                else
                {
                    ShowErrorMsg("Oops! looks like you have tried incorrect link, please try correct link from email.", true);
                }
            }
        }
        protected void btnSendVerificationLink_Click(object sender, EventArgs e)
        {
            lblErrorMsg.Text = "";
            try
            {
                if (txtEmailID.Text != string.Empty)
                {
                    Dictionary<string, string> parameters = new Dictionary<string, string>();
                    parameters.Add("emailid", txtEmailID.Text);
                    parameters.Add("isActve", "true");
                    string query = "select * from users where useremailID = @emailid and isActive = @isActve;";
                    DataTable dtUserDetail = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(query, parameters);
                    if (dtUserDetail != null & dtUserDetail.Rows.Count > 0)
                    {
                        ///Update previous links as IsActive false so that previous links become inactive
                        markPreviousLinksAsInActive(Convert.ToInt32(dtUserDetail.Rows[0]["UserID"]));
                        ///Create new GUID Link
                        Guid guidResetLink = Guid.NewGuid();
                        string userGuid = Convert.ToString(guidResetLink.ToString());
                        Dictionary<string, string> parametersLink = new Dictionary<string, string>();
                        parametersLink.Add("linkGUID", userGuid);
                        parametersLink.Add("lUserID", Convert.ToString(dtUserDetail.Rows[0]["UserID"]));
                        parametersLink.Add("lIsActive", true.ToString());
                        parametersLink.Add("lcreatedDate", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"));


                        string insertQuery = "INSERT INTO [dbo].[forgotpasswordlink]([linkGUID],[fkUserID],[isActive],[CreatedDate])" +
                                            "VALUES(@linkGUID,@lUserID,@lIsActive,@lcreatedDate);";

                        int insertResult = DataAccessLayer.DataAccessLayer.ExecuteNonQuery(insertQuery, parametersLink);
                        if (insertResult > 0)
                        {
                            objBusinessL.SendMail(txtEmailID.Text, "Skartif - Password Reset Link", "Please click on this link to reset your password. Link - www.skartif.com/forgotpassword.aspx?uid=" + userGuid);
                            ShowErrorMsg("Please check your email, we have sent a link on your EmailID-" + txtEmailID.Text, false);
                        }
                        else
                        {
                            ShowErrorMsg("Oops! looks like there is some error while processing. Please try again.", true);
                        }
                    }
                    else
                    {
                        ShowErrorMsg("Email ID does not exists in our system. Please enter valid Email ID.", true);
                    }
                }
                else
                {
                    ShowErrorMsg("Please enter required fields", true);
                }
            }
            catch (Exception ex)
            {
                ShowErrorMsg(ex.Message, true);
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "forgotpassword", "E", "admin");
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

        public void markPreviousLinksAsInActive(int UserID)
        {
            Dictionary<string, string> parametersLink = new Dictionary<string, string>();
            parametersLink.Add("lUserID", Convert.ToString(UserID));
            parametersLink.Add("lIsActive", false.ToString());
            string updateQuery = "UPDATE [dbo].[forgotpasswordlink] SET IsActive = @lIsActive WHERE fkUserID = @lUserID;";
            int updateResult = DataAccessLayer.DataAccessLayer.ExecuteNonQuery(updateQuery, parametersLink);
        }

        public bool checkIfValidGUID(string verifictionGUID)
        {
            bool result = false;
            Dictionary<string, string> checkValidGUIDParameters = new Dictionary<string, string>();
            checkValidGUIDParameters.Add("verifictionGUID", verifictionGUID);
            checkValidGUIDParameters.Add("isActive", true.ToString());
            string validateGUIDQuery = "select top 1 * from forgotpasswordlink where linkGUID = @verifictionGUID and isActive = @isActive;";
            DataTable dtGUIDParameters = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(validateGUIDQuery, checkValidGUIDParameters);
            if (dtGUIDParameters != null && dtGUIDParameters.Rows.Count > 0)
            {
                result = true;
            }
            return result;
        }

        public int getUserIDFromLink(string verifictionGUID)
        {
            int userID = 0;
            Dictionary<string, string> checkValidGUIDParameters = new Dictionary<string, string>();
            checkValidGUIDParameters.Add("verifictionGUID", verifictionGUID);
            checkValidGUIDParameters.Add("isActive", true.ToString());
            string validateGUIDQuery = "select top 1 * from forgotpasswordlink where linkGUID = @verifictionGUID and isActive = @isActive;";
            DataTable dtGUIDParameters = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(validateGUIDQuery, checkValidGUIDParameters);
            if (dtGUIDParameters != null && dtGUIDParameters.Rows.Count > 0)
            {
                userID = Convert.ToInt32(dtGUIDParameters.Rows[0]["fkUserID"].ToString());
            }
            return userID;
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            lblErrorMsg.Text = "";
            try
            {
                if (txtPassword1.Text != string.Empty && txtPassword2.Text != string.Empty)
                {
                    if (txtPassword1.Text == txtPassword2.Text)
                    {
                        string verificationGUID = Request.QueryString["uid"] != null ? Convert.ToString(Request.QueryString["uid"]) : "";
                        if (verificationGUID != "")
                        {
                            int userID = getUserIDFromLink(verificationGUID);
                            if (userID > 0)
                            {
                                Dictionary<string, string> parameters = new Dictionary<string, string>();
                                parameters.Add("uUserID", userID.ToString());
                                parameters.Add("upassword", txtPassword1.Text);
                                parameters.Add("pUpdatedBy", userID.ToString());
                                parameters.Add("pUpdatedDate", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"));

                                string query = "update users set UserPassword = @upassword, UpdatedBy = @uUserID, UpdatedDate = @pUpdatedDate where userid = @uUserID";
                                int updateResult = DataAccessLayer.DataAccessLayer.ExecuteNonQuery(query, parameters);
                                if (updateResult > 0)
                                {
                                    markPreviousLinksAsInActive(Convert.ToInt32(userID));
                                    ShowErrorMsg("Password successfully changed.", false);
                                }
                            }
                            else
                            {
                                ShowErrorMsg("Oops! looks like you have tried incorrect link, please try correct link from email.", true);
                            }
                        }
                        else
                        {
                            ShowErrorMsg("Oops! looks like you have tried incorrect link, please try correct link from email.", true);
                        }
                    }
                    else
                    {
                        ShowErrorMsg("Password does not match.Please enter correct password in fields.", true);
                    }
                }
                else
                {
                    ShowErrorMsg("Please enter required fields", true);
                }
            }
            catch (Exception ex)
            {
                ShowErrorMsg(ex.Message, true);
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "forgotpassword", "E", "admin");
            }
        }
    }
}
