using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;

namespace BloodBankProject.DAL
{
    public class Doctor_DAL : Doctor_DALBASE
    {

        #region PR_Doctor_SelectForDropDownList
        public DataTable PR_Doctor_SelectForDropDownList()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Doctor_SelectForDropDownList");
                DataTable dtDoctorDropDown = new DataTable();
                using (IDataReader drDoctorDropDown = sqlDB.ExecuteReader(dbCMD))
                {
                    dtDoctorDropDown.Load(drDoctorDropDown);
                }
                return dtDoctorDropDown;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

    }
}
