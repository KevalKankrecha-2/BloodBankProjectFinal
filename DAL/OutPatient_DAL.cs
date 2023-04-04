using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;

namespace BloodBankProject.DAL
{
    public class OutPatient_DAL : OutPatient_DALBASE
    {
        #region PR_BloodStock_SelectInStockBloodBagsAndPriceByBloodGroup
        public DataTable PR_BloodStock_SelectInStockBloodBagsAndPriceByBloodGroup(int BloodGroupID)
        {
            /* try
             {*/
            SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodStock_SelectInStockBloodBagsAndPriceByBloodGroup");
            sqlDB.AddInParameter(dbCMD, "BloodGroupID", SqlDbType.Int, BloodGroupID);
            DataTable dtBloodGroupPrice = new DataTable();
            using (IDataReader drBloodGroupPrice = sqlDB.ExecuteReader(dbCMD))
            {
                dtBloodGroupPrice.Load(drBloodGroupPrice);
            }
            return dtBloodGroupPrice;
            /*   }
               catch (Exception ex)
               {
                   return null;
               }*/
        }

        #endregion

        #region PR_BloodStockUpdateStatusByBloodBagSerialNumber
        public void PR_BloodStockUpdateStatusByBloodBagSerialNumber(int BloodBagIdForOut, string OutPatientID)
        {
            /*try
            {*/
            SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodStockUpdateStatusByBloodBagSerialNumber");
            sqlDB.AddInParameter(dbCMD, "BloodBagSerialNumber", SqlDbType.Int, BloodBagIdForOut);
            sqlDB.AddInParameter(dbCMD, "OutPatientID", SqlDbType.NVarChar, OutPatientID);
            sqlDB.ExecuteNonQuery(dbCMD);
            /*}
            catch (Exception ex)
            {
            }*/
        }

        #endregion
    }
}
