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
    public partial class register : System.Web.UI.Page
    {
        BusinessLayer.BusinessLayer objBusinessL = new BusinessLayer.BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            lblErrorMsg.Text = "";
            try
            {
                if (validateInput())
                {
                    Dictionary<string, string> parameters = new Dictionary<string, string>();
                    parameters.Add("uEmailID", txtEmailAddress.Text);
                    parameters.Add("uPassword", txtPassword.Text);
                    parameters.Add("uFirstName", txtFirstName.Text);
                    parameters.Add("uLastName", txtLastName.Text);
                    parameters.Add("uMobileNo", txtMobileNo.Text);
                    parameters.Add("uisActive", true.ToString());
                    parameters.Add("uIsNotify", true.ToString());
                    parameters.Add("uCreatedDate", DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"));

                    string query = "INSERT INTO [dbo].[Users]([UserEmailID],[UserPassword],[UserFirstName],[UserLastName],[UserMobileNo]" +
                                    ",[IsActive],[IsNotify],CreatedDate)VALUES(@uEmailID,@uPassword,@uFirstName,@uLastName,@uMobileNo,@uisActive,@uIsNotify,@uCreatedDate)";

                    int insertResult = DataAccessLayer.DataAccessLayer.ExecuteNonQuery(query, parameters);
                    if (insertResult > 0)
                    {
                        objBusinessL.SendMail(txtEmailAddress.Text, "Welcome to Skartif.com.", "Congraulations! We are happy to have you as our customer");
                        if (txtEmailAddress.Text != "" && txtPassword.Text != "")
                        {
                            Dictionary<string, string> parametersGetUserDetails = new Dictionary<string, string>();
                            parametersGetUserDetails.Add("emailid", txtEmailAddress.Text);
                            parametersGetUserDetails.Add("pswd", txtPassword.Text);
                            parametersGetUserDetails.Add("isActve", "true");
                            string queryGetUser = "select * from users where useremailID = @emailid and userPassword = @pswd and isActive = @isActve;";
                            DataTable dtLoginDetail = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(queryGetUser, parametersGetUserDetails);
                            if (dtLoginDetail != null & dtLoginDetail.Rows.Count > 0)
                            {
                                Session["UserFirstName"] = Convert.ToString(dtLoginDetail.Rows[0]["UserFirstName"]);
                                Session["UserID"] = Convert.ToString(dtLoginDetail.Rows[0]["UserID"]);
                                Session["UserEmailID"] = Convert.ToString(dtLoginDetail.Rows[0]["UserEmailID"]);
                                Response.Redirect("/home.aspx");
                            }
                            else
                            {
                                ShowErrorMsg("Please enter valid credentials.", true);
                            }
                        }                        
                    }
                    else
                    {
                        ShowErrorMsg("Oops! looks like there is some error while processing. Please try again.", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ShowErrorMsg(ex.Message, true);
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "btnRegister_Click", "E", "admin");
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

        public bool validateInput()
        {
            bool result = true;
            if (txtEmailAddress.Text == string.Empty || txtMobileNo.Text == string.Empty)
            {
                ShowErrorMsg("Please enter required fields", true);
                result = false;
            }
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                ShowErrorMsg("Password does not match, please enter correct password in both password fields.", true);
                result = false;
            }
            if (txtEmailAddress.Text != string.Empty && checkIfEmailIDExists(txtEmailAddress.Text))
            {
                ShowErrorMsg("Email Address already exists in our system. Please try with other email address.", true);
                result = false;
            }
            return result;
        }

        public bool checkIfEmailIDExists(string emailID)
        {
            bool isEmailIDExists = false;
            Dictionary<string, string> checkEmailIDExists = new Dictionary<string, string>();
            checkEmailIDExists.Add("uEmailID", emailID);
            checkEmailIDExists.Add("isActive", true.ToString());
            string validateEmailID = "select top 1 * from users where useremailid = @uEmailID and isActive = @isActive;";
            DataTable dtValidateEmailID = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(validateEmailID, checkEmailIDExists);
            if (dtValidateEmailID != null && dtValidateEmailID.Rows.Count > 0)
            {
                isEmailIDExists = true;
            }
            return isEmailIDExists;
        }
    }
}
