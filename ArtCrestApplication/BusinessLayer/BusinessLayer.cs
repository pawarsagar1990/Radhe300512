using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
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
    }
}
