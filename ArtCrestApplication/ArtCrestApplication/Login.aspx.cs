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
    public partial class Login : System.Web.UI.Page
    {
        BusinessLayer.BusinessLayer objBusinessL = new BusinessLayer.BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblErrorMsg.Text = "";
            try
            {
                if (txtEmailID.Text != "" && txtPassword.Text != "")
                {
                    Dictionary<string, string> parameters = new Dictionary<string, string>();
                    parameters.Add("emailid", txtEmailID.Text);
                    parameters.Add("pswd", txtPassword.Text);
                    parameters.Add("isActve", "true");
                    string query = "select * from users where useremailID = @emailid and userPassword = @pswd and isActive = @isActve;";
                    DataTable dtLoginDetail = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(query, parameters);
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
                else
                {
                    ShowErrorMsg("Please enter required fields", true);
                }
            }
            catch (Exception ex)
            {
                ShowErrorMsg(ex.Message, true);
                BusinessLayer.BusinessLayer.LogTracer(ex.Message + "- stack trace =" + ex.StackTrace.ToString(), "Login", "E", "admin");
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