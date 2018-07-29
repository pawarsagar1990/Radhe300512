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
                    
                    string query = "INSERT INTO [dbo].[Users]([UserEmailID],[UserPassword],[UserFirstName],[UserLastName],[UserMobileNo]" +
                                    ",[IsActive],[IsNotify])VALUES(@uEmailID,@uPassword,@uFirstName,@uLastName,@uMobileNo,@uisActive,@uIsNotify)";

                    int insertResult = DataAccessLayer.DataAccessLayer.ExecuteNonQuery(query, parameters);
                    if (insertResult > 0)
                    {
                        objBusinessL.SendMail(txtEmailAddress.Text,"Welcome to Skartif.com.","Congraulations! We are happy to have you as our customer");
                        Response.Redirect("/home.aspx");
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
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "acsupportlogin", "E", "admin");
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
            return result;
        }
    }
}
