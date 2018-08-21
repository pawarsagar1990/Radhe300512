using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtCrestApplication
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string pageName = this.ContentPlaceHolder1.Page.GetType().BaseType.Name;
            if (hdnPages.Value.ToLower().Contains(pageName.ToLower()))
            {
                if (Session["SupportLoginID"] == null)
                {
                    Response.Redirect("/acsupport/acsupportlogin.aspx");
                }                
            }

            if (Session["UserFirstName"] != null)
            {
                guestNameID.InnerHtml = Session["UserFirstName"].ToString();
                masterLogin.Visible = false;
                mobileLoginLoginButton.Visible = false;
                masterLogout.Visible = true;
                mobileLoginLogoutButton.Visible = true;
            }
            else
            {
                masterLogin.Visible = true;
                mobileLoginLoginButton.Visible = true;
                masterLogout.Visible = false;
                mobileLoginLogoutButton.Visible = false;
            }

            if (Session["CartItemCount"] != null)
            {
                cartItemCount.InnerHtml = Session["CartItemCount"].ToString();
            }

        }
    }
}