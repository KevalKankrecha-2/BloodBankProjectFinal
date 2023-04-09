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
            /*try
            {*/
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodBag_SelectInStockBloodBagsCountByBloodGroup");
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
