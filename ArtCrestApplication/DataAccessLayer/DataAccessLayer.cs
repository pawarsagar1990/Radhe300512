using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DataAccessLayer
    {
        string ConnString = ConfigurationManager.ConnectionStrings["ArtCrestConnection"].ToString();
        public DataTable getDataFromQuery(string query)
        {
            DataTable dtTable = new DataTable();
            try
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConnString;
                con.Close();
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dtTable);
                con.Close();

            }
            catch (Exception ex)
            {
                LogTracerDA("Log", "Query Here-> "+ query +"->"+ex.Message, "Method Name : getDataFromQuery ", "E");
            }
            return dtTable;
        }

        public int insertIntoTable(string query)
        {
            int rowsInserted = 0;
            SqlConnection con = new SqlConnection();
            try
            {
                con.ConnectionString = ConnString;
                con.Close();
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                rowsInserted = cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                con.Close();
                LogTracerDA("Log", "- Insert Query => " + query + " $$ Error is ==> " + ex.Message, "Method Name : insertIntoTable", "E");
            }
            return rowsInserted;
        }

        public void LogTracerDA(string strFolder, string ErrMsg, string FunctionalArea, string ErrorType, string UserID = "")
        {
            string strErrorString = "";
            try
            {
                strErrorString = "Insert into logdetails (FunctionalArea,ErrorType, ErrorMessage, UserID, DateTime) values ('" + FunctionalArea + "','" + ErrorType + "','" + ErrMsg.Replace("'", "") + "','" + UserID + "',GETDATE());";
                int rowsInserted = 0;
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConnString;
                con.Close();
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = strErrorString;
                cmd.Connection = con;
                rowsInserted = cmd.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static int ExecuteNonQuery(string query, Dictionary<string, string> parameters)
        {            
            int rowsInserted = 0;
            SqlConnection con = new SqlConnection();
            try
            {
                string ConnString = ConfigurationManager.ConnectionStrings["ArtCrestConnection"].ToString();
                con.ConnectionString = ConnString;
                con.Close();
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                if (parameters != null)
                {
                    foreach (KeyValuePair<string, string> parameter in parameters)
                    {
                        cmd.Parameters.AddWithValue(parameter.Key, parameter.Value);
                    }
                }
                rowsInserted = cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                con.Close();
                DataAccessLayer objDAL = new DataAccessLayer();
                objDAL.LogTracerDA("Log", "- Insert Query => " + query + " $$ Error is ==> " + ex.Message, "Method Name : insertIntoTable", "E");
            }
            return rowsInserted;            
        }

        public static DataTable getDataFromQueryWithParameters(string query, Dictionary<string, string> parameters)
        {
            DataTable dtTable = new DataTable();
            try
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ArtCrestConnection"].ToString();
                con.Close();
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                if (parameters != null)
                {
                    foreach (KeyValuePair<string, string> parameter in parameters)
                    {
                        cmd.Parameters.AddWithValue(parameter.Key, parameter.Value);
                    }
                }
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dtTable);
                con.Close();

            }
            catch (Exception ex)
            {
                DataAccessLayer objDAL = new DataAccessLayer();
                objDAL.LogTracerDA("Log", "Query Here-> " + query + "->" + ex.Message, "Method Name : getDataFromQuery ", "E");
            }
            return dtTable;
        }

        public DataSet AddToCart(int ProductID, int UserID, int ProductQuantity = 1, int CartID = 0)
        {
            DataSet dsData = new DataSet();
            try
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConnString;
                con.Close();
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "AddToCart";
                cmd.Parameters.AddWithValue("CartID", CartID);
                cmd.Parameters.AddWithValue("ProductID", ProductID);
                cmd.Parameters.AddWithValue("UserID", UserID);
                cmd.Parameters.AddWithValue("ProductQuantity", ProductQuantity);
                cmd.Connection = con;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dsData);
                con.Close();

            }
            catch (Exception ex)
            {
                LogTracerDA("Log", "Query Here-> AddToCart->" + ex.Message + ex.StackTrace.ToString(), "Method Name : AddToCart ", "E");
            }
            return dsData;
        }

        public DataSet CreateConfirmOrder(int UserID, int CartID)
        {
            DataSet dsData = new DataSet();
            try
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConnString;
                con.Close();
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "CreateOrder";
                cmd.Parameters.AddWithValue("CartID", CartID);                
                cmd.Parameters.AddWithValue("UserID", UserID);
                cmd.Connection = con;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dsData);
                con.Close();

            }
            catch (Exception ex)
            {
                LogTracerDA("Log", "Query Here-> CreateConfirmOrder->" + ex.Message + ex.StackTrace.ToString(), "Method Name : CreateConfirmOrder ", "E");
            }
            return dsData;
        }
    }
}
