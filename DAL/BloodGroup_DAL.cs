using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;

namespace BloodBankProject.DAL
{
    public class BloodGroup_DAL : BloodGroup_DALBASE
    {
        #region PR_BloodGroupSelectForDropDownList
        public DataTable PR_BloodGroupSelectForDropDownList()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodGroupSelectForDropDownList");
                DataTable dtBloodGroupDropDown = new DataTable();
                using (IDataReader drBloodGroupDropDowm = sqlDB.ExecuteReader(dbCMD))
                {
                    dtBloodGroupDropDown.Load(drBloodGroupDropDowm);
                }
                return dtBloodGroupDropDown;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        
    }
}
