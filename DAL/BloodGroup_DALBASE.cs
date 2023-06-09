﻿using BloodBankProject.Areas.BloodGroup.Models;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;
using BloodBankProject.BAL;

namespace BloodBankProject.DAL
{
    public class BloodGroup_DALBASE : DALHelper
    {
        #region PR_BloodGroup_SelectAll
        public DataTable PR_BloodGroup_SelectAll()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodGroup_SelectAll");
                DataTable dtBloodGroup = new DataTable();
                using (IDataReader drBloodGroup = sqlDB.ExecuteReader(dbCMD))
                {
                    dtBloodGroup.Load(drBloodGroup);
                }
                return dtBloodGroup;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region PR_BloodGroup_SelectByPK
        public DataTable PR_BloodGroup_SelectByPK(int? BloodGroupID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodGroup_SelectByPK");
                sqlDB.AddInParameter(dbCMD, "BloodGroupID", SqlDbType.Int, BloodGroupID);
                DataTable dtBloodGroup = new DataTable();

                using (IDataReader drBloodGroup = sqlDB.ExecuteReader(dbCMD))
                {
                    dtBloodGroup.Load(drBloodGroup);
                }
                return dtBloodGroup;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region PR_BloodGroupDeleteByPK
        public DataTable PR_BloodGroupDeleteByPK(int? BloodGroupID)
        {
         /*   try
            {*/
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodGroup_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "BloodGroupID", SqlDbType.Int, BloodGroupID);
                DataTable dtBloodGroup = new DataTable();

                using (IDataReader drBloodGroup = sqlDB.ExecuteReader(dbCMD))
                {
                    dtBloodGroup.Load(drBloodGroup);
                }
                return dtBloodGroup;
            /*}
            catch (Exception ex)
            {
                return null;
            }*/
        }

        #endregion

        #region PR_BloodGroup_InsertByUserID
        public void PR_BloodGroup_InsertByUserID(BloodGroupModel modelBloodGroup)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodGroup_InsertByUserID");
                sqlDB.AddInParameter(dbCMD, "BloodGroupName", SqlDbType.NVarChar, modelBloodGroup.BloodGroupName.Trim());
                sqlDB.AddInParameter(dbCMD, "Price", SqlDbType.Decimal, modelBloodGroup.Price);
                sqlDB.AddInParameter(dbCMD, "Description", SqlDbType.NVarChar, modelBloodGroup.Description);
                sqlDB.AddInParameter(dbCMD, "UserId", SqlDbType.Int, CommonVariables.UserID());
                sqlDB.ExecuteNonQuery(dbCMD);
            }
            catch (Exception ex)
            {

            }
        }

        #endregion

        #region PR_BloodGroup_UpdateByPKUserID
        public void PR_BloodGroup_UpdateByPKUserID(BloodGroupModel modelBloodGroup)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodGroup_UpdateByPKUserID");
                sqlDB.AddInParameter(dbCMD, "BloodGroupName", SqlDbType.NVarChar, modelBloodGroup.BloodGroupName.Trim());
                sqlDB.AddInParameter(dbCMD, "Description", SqlDbType.NVarChar, modelBloodGroup.Description);
                sqlDB.AddInParameter(dbCMD, "Price", SqlDbType.Decimal, modelBloodGroup.Price);
                sqlDB.AddInParameter(dbCMD, "UserId", SqlDbType.Int, CommonVariables.UserID());
                sqlDB.AddInParameter(dbCMD, "BloodGroupID", SqlDbType.Int, modelBloodGroup.BloodGroupID);
                sqlDB.ExecuteNonQuery(dbCMD);
            }
            catch (Exception ex)
            {

            }
        }

        #endregion
    }
}
