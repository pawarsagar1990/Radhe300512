using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLayer
{
    public class BusinessLayer
    {

        DataAccessLayer.DataAccessLayer objDataAccess = new DataAccessLayer.DataAccessLayer();
        public static void LogTracer(string ErrMsg, string FunctionalArea, string ErrorType, string UserID = "")
        {
            string strErrorString = "";
            try
            {
                ErrMsg.Replace("'", "");
                strErrorString = "Insert into logdetails (FunctionalArea,ErrorType, ErrorMessage, UserID, DateTime) values ('" + FunctionalArea + "','" + ErrorType + "','" + ErrMsg + "','" + UserID + "',GETDATE());";
                DataAccessLayer.DataAccessLayer objDataAccess = new DataAccessLayer.DataAccessLayer();
                int rows = objDataAccess.insertIntoTable(strErrorString);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable getDataFromQuery(string query)
        {
            DataTable dtTable = new DataTable();
            try
            {
                dtTable = objDataAccess.getDataFromQuery(query);
            }
            catch (Exception ex)
            {
                LogTracer("Log", ex.Message, "Method Name : BL getDataFromQuery ", "E");
            }
            return dtTable;
        }

        public int insertIntoTable(string query)
        {
            int rowsInserted = 0;
            try
            {
                rowsInserted = objDataAccess.insertIntoTable(query);
            }
            catch (Exception ex)
            {
                LogTracer("Log", ex.Message, "Method Name :BL insertIntoTable ", "E");
            }
            return rowsInserted;
        }

        public DataTable GetSuperCategory()
        {
            DataTable dtSuperCategory = getDataFromQuery("select * from ProductSuperCategory where isactive = 1 order by productsupercategoryname asc");            
            return dtSuperCategory;
        }
        public DataTable GetCategory(int productsupercategoryID)
        {
            string strQuery = "";
            if (productsupercategoryID > 0)
            {
                strQuery = "select * from ProductCategory where fkProductSuperCategryID = " + productsupercategoryID + " and isactive = 1 order by productcategoryname asc";
            }
            else
            {
                strQuery = "select * from ProductCategory where isactive = 1 order by productcategoryname asc";
            }
            DataTable dtCategory = getDataFromQuery(strQuery);
            return dtCategory;            
        }

        public DataTable GetSubCategory(int productCategoryID)
        {
            string strQuery = "";
            if (productCategoryID > 0)
            {
                strQuery = "select * from ProductSubCategory where fkproductCategoryID = " + productCategoryID + " and isactive = 1 order by ProductSubCategoryName asc";
            }
            else
            {
                strQuery = "select * from ProductSubCategory where isactive = 1 order by ProductSubCategoryName asc";
            }
            DataTable dtSubCategory = getDataFromQuery(strQuery);
            return dtSubCategory;
        }

        public DataTable GetProductsFromSubCategory(int productSubCategoryID)
        {
            string strQuery = "";
            if (productSubCategoryID > 0)
            {
                strQuery = "select * from Product where fkproductSubCategoryID = " + productSubCategoryID + " and isactive = 1 order by ProductName asc";
            }
            else
            {
                strQuery = "select * from Product where isactive = 1 order by ProductName asc";
            }
            DataTable dtProduct = getDataFromQuery(strQuery);
            return dtProduct;
        }

        public void bindVendor()
        {
            //drpVendor.Items.Add(new ListItem("Skartif", "1"));
            ////DataTable dtCategory = objBusinessL.getDataFromQuery("select * from Vendor where isactive = 1 order by 1 asc");
            ////if (dtCategory != null && dtCategory.Rows.Count > 0)
            ////{
            ////    drpVendor.DataSource = dtCategory;
            ////    drpVendor.DataTextField = "VendorName";
            ////    drpVendor.DataValueField = "VendorID";
            ////    drpVendor.DataBind();
            ////}
            ////else
            ////{
            ////    drpVendor.Items.Add(new ListItem("Skartif", "1"));
            ////}
        }

        public DataTable GetProductDetailOnProductID(int productID)
        {
            string strQuery = "";
            if (productID > 0)
            {
                strQuery = "select * from Product where productid = "+ productID +" and isactive = 1 order by ProductName asc";
            }            
            DataTable dtProduct = getDataFromQuery(strQuery);
            return dtProduct;
        }

        public string SendMail(string mailToAddress, string mailSubject, string mailBody)
        {
            string strResult = "";
            try
            {
                MailMessage message = new MailMessage();
                SmtpClient smtpClient = new SmtpClient();
                string msg = string.Empty;
                try
                {
                    MailAddress fromAddress = new MailAddress("info@skartif.com");
                    message.From = fromAddress;
                    message.To.Add(mailToAddress);
                    message.Subject = mailSubject;
                    message.IsBodyHtml = true;
                    message.Body = mailBody;
                    smtpClient.Host = "smtp.zoho.com";   //-- Donot change.
                    smtpClient.Port = 587; //--- Donot change
                    smtpClient.EnableSsl = true;//--- Donot change                    
                    smtpClient.Credentials = new System.Net.NetworkCredential("info@skartif.com", "Startup@007");
                    smtpClient.Send(message);

                }
                catch (Exception ex)
                {

                    strResult = ex.Message;
                }
            }
            catch (Exception ex)
            {
                LogTracer("Log", ex.Message, "Method Name : SendMail", "E");
            }

            return strResult;

        }

    }
}
