using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;

namespace BloodBankProject.DAL
{
    public class BloodBag_DAL : BloodBag_DALBASE
    {
        #region PR_BloodBag_SelectInStockBloodBagsCountByBloodGroup
        public DataTable PR_BloodBag_SelectInStockBloodBagsCountByBloodGroup()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodBag_SelectInStockBloodBagsCountByBloodGroup");
                DataTable dtBloodBag = new DataTable();
                using (IDataReader drBloodBag = sqlDB.ExecuteReader(dbCMD))
                {
                    dtBloodBag.Load(drBloodBag);
                }
                return dtBloodBag;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region PR_BloodBag_SelectInStockBloodBagsAndPriceByBloodGroup
        public DataTable PR_BloodBag_SelectInStockBloodBagsAndPriceByBloodGroup(int BloodGroupID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodBag_SelectInStockBloodBagsAndPriceByBloodGroup");
            sqlDB.AddInParameter(dbCMD, "BloodGroupID", SqlDbType.Int, BloodGroupID);
            DataTable dtBloodGroupPrice = new DataTable();
            using (IDataReader drBloodGroupPrice = sqlDB.ExecuteReader(dbCMD))
            {
                dtBloodGroupPrice.Load(drBloodGroupPrice);
            }
            return dtBloodGroupPrice;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region PR_BloodBag_UpdateStatusByBloodBagSerialNumber
        public void PR_BloodBag_UpdateStatusByBloodBagSerialNumber(int BloodBagIdForOut, int OutPatientID)
        {
            try
            {
            SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodBag_UpdateStatusByBloodBagSerialNumber");
            sqlDB.AddInParameter(dbCMD, "BloodBagIdForOut", SqlDbType.Int, BloodBagIdForOut);
            sqlDB.AddInParameter(dbCMD, "OutPatientID", SqlDbType.Int, OutPatientID);
            sqlDB.ExecuteNonQuery(dbCMD);
            }
            catch (Exception ex)
            {
            }
        }

        #endregion

        #region PR_BloodBag_SelectByFilterBloodGroupStatus
        public DataTable PR_BloodBag_SelectByFilterBloodGroupStatus(int BloodGroupID, string Status)
        {
          /*  try
            {*/
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodBag_SelectByFilterBloodGroupStatus");
                if (BloodGroupID == 0)
                {
                    sqlDB.AddInParameter(dbCMD, "BloodGroupID", SqlDbType.Int, null);
                }
                else
                {
                    sqlDB.AddInParameter(dbCMD, "BloodGroupID", SqlDbType.Int, BloodGroupID);
                }
                if (Status == null)
                {
                    sqlDB.AddInParameter(dbCMD, "Status", SqlDbType.NVarChar, null);
                }
                else
                {
                    sqlDB.AddInParameter(dbCMD, "Status", SqlDbType.NVarChar, Status);
                }
                DataTable dtBloodBag = new DataTable();
                using (IDataReader drBloodBag = sqlDB.ExecuteReader(dbCMD))
                {
                    dtBloodBag.Load(drBloodBag);
                }
                return dtBloodBag;
          /*  }
            catch (Exception ex)
            {
                return null;
            }*/
        }

        #endregion



        #region PR_BloodBag_SelectStatusWiseBloodBagCount
        public DataTable PR_BloodBag_SelectStatusWiseBloodBagCount()
        {
            /* try
             {*/
            SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodBag_SelectStatusWiseBloodBagCount");
            DataTable dtBloodBag = new DataTable();
            using (IDataReader drBloodBag = sqlDB.ExecuteReader(dbCMD))
            {
                dtBloodBag.Load(drBloodBag);
            }
            return dtBloodBag;
            /*  }
              catch (Exception ex)
              {
                  return null;
              }*/
        }

        #endregion
    }
}
