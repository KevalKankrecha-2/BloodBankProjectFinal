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
        #region PR_BloodStockCountBloodBagsByBloodGroup
        public DataTable PR_BloodStockCountBloodBagsByBloodGroup()
        {
            /*try
            {*/
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodStockCountBloodBagsByBloodGroup");
                DataTable dtBloodBag = new DataTable();
                using (IDataReader drBloodBag = sqlDB.ExecuteReader(dbCMD))
                {
                    dtBloodBag.Load(drBloodBag);
                }
                return dtBloodBag;
            /*}
            catch (Exception ex)
            {
                return null;
            }*/
        }

        #endregion

    }
}
