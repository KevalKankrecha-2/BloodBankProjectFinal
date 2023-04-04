using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;

namespace BloodBankProject.DAL
{
    public class LOC_DAL : LOC_DALBASE
    {
        #region PR_State_SelectForDropDownList
        public DataTable PR_State_SelectForDropDownList()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_State_SelectForDropDownList");
                DataTable dtState = new DataTable();
                using (IDataReader drState = sqlDB.ExecuteReader(dbCMD))
                {
                    dtState.Load(drState);
                }
                return dtState;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region PR_City_SelectForDropDownListByStateID
        public DataTable PR_City_SelectForDropDownListByStateID(int StateID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_City_SelectForDropDownListByStateID");
                sqlDB.AddInParameter(dbCMD, "StateID", DbType.Int32, StateID);
                DataTable dtCity = new DataTable();
                using (IDataReader drCity = sqlDB.ExecuteReader(dbCMD))
                {
                    dtCity.Load(drCity);
                }
                return dtCity;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion
    }
}
