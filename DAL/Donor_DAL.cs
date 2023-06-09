﻿using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;

namespace BloodBankProject.DAL
{
    public class Donor_DAL : Donor_DALBASE
    {
        #region PR_Donor_SelectForDropDownList
        public DataTable PR_Donor_SelectForDropDownList()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Donor_SelectForDropDownList");
                DataTable dtDonorDropDown = new DataTable();
                using (IDataReader drDonorDropDown = sqlDB.ExecuteReader(dbCMD))
                {
                    dtDonorDropDown.Load(drDonorDropDown);
                }
                return dtDonorDropDown;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region PR_Donor_SelectByBloodGroup
        public DataTable PR_Donor_SelectByBloodGroup(int BloodGroupID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Donor_SelectByBloodGroup");
                sqlDB.AddInParameter(dbCMD, "BloodGroupID", DbType.Int32, BloodGroupID);
                DataTable dtDonorDropDown = new DataTable();
                using (IDataReader drDonorDropDown = sqlDB.ExecuteReader(dbCMD))
                {
                    dtDonorDropDown.Load(drDonorDropDown);
                }
                return dtDonorDropDown;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region PR_Donor_SelectByFilterBloodGroupStateCity
        public DataTable PR_Donor_SelectByFilterBloodGroupStateCity(int BloodGroupID, int StateID, int CityID)
        {
            /*  try
              {*/
            SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Donor_SelectByFilterBloodGroupStateCity");
            if (BloodGroupID == 0)
            {
                sqlDB.AddInParameter(dbCMD, "BloodGroupID", SqlDbType.Int, null);
            }
            else
            {
                sqlDB.AddInParameter(dbCMD, "BloodGroupID", SqlDbType.Int, BloodGroupID);
            }
            if (StateID == 0)
            {
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.NVarChar, null);
            }
            else
            {
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.NVarChar, StateID);
            }
            if (CityID == 0)
            {
                sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.NVarChar, null);
            }
            else
            {
                sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.NVarChar, CityID);
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
    }
}
