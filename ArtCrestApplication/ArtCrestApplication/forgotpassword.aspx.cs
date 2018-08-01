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
                            objBusinessL.SendMail(txtEmailID.Text, "Skartif - Password Reset Link", "Please click on this link to reset your password. Link - www.skartif.com/forgotpassword.aspx?uid="+ userGuid);
                            ShowErrorMsg("Please check your email, we have sent a link on your EmailID-"+txtEmailID.Text, false);
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
    }
}