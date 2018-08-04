using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
using DataAccessLayer;


namespace ArtCrestApplication.acsupport
{
    public partial class acsupportlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblErrorMsg.Text = "";
            try
            {
                if (txtUserName.Text != "" && txtPassword.Text != "")
                {
                    Dictionary<string, string> parameters = new Dictionary<string, string>();
                    parameters.Add("usrnm", txtUserName.Text);
                    parameters.Add("pswd", txtPassword.Text);
                    parameters.Add("isActve", "true");
                    string query = "select * from supportlogin where SupportUserName = @usrnm and SupportPassWord = @pswd and isActive = @isActve;";
                    DataTable dtSupportLogin = DataAccessLayer.DataAccessLayer.getDataFromQueryWithParameters(query, parameters);
                    if (dtSupportLogin != null & dtSupportLogin.Rows.Count > 0)
                    {
                        Session["UserFirstName"] = Convert.ToString(dtSupportLogin.Rows[0]["SupportFirstName"]) + " " + Convert.ToString(dtSupportLogin.Rows[0]["SupportLastName"]);
                        Session["SupportLoginID"] = Convert.ToString(dtSupportLogin.Rows[0]["SupportLoginID"]);
                        Session["UserName"] = Convert.ToString(dtSupportLogin.Rows[0]["SupportUserName"]);
                        Session["IsAdmin"] = Convert.ToString(dtSupportLogin.Rows[0]["IsAdmin"]);
                        Session["IsSupportMember"] = Convert.ToString(dtSupportLogin.Rows[0]["IsSupportMember"]);
                        Response.Redirect("acsupportmenu.aspx");
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
    }
}