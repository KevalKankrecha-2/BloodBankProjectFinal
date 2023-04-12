using BloodBankProject.Areas.BloodBank.Models;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System;
using System.Data;
using System.Data.Common;
using BloodBankProject.BAL;
using BloodBankProject.Areas.BloodBag.Models;
/*using BloodBank.Areas.BloodBag.Models;*/

namespace BloodBankProject.DAL
{
    public class BloodBag_DALBASE : DALHelper
    {
        #region PR_BloodBag_InsertByUserID
        public void PR_BloodBag_InsertByUserID(BloodBagModel modelBloodBag)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodBag_InsertByUserID");
                sqlDB.AddInParameter(dbCMD, "BloodGroupID ", SqlDbType.Int, modelBloodBag.BloodGroupID);
                sqlDB.AddInParameter(dbCMD, "DonorID", SqlDbType.Int, modelBloodBag.DonorID);
                sqlDB.AddInParameter(dbCMD, "VerifiedDoctorID", SqlDbType.Int, modelBloodBag.VerifiedDoctorID);
                sqlDB.AddInParameter(dbCMD, "VerificationDoctorRemarks ", SqlDbType.NVarChar, modelBloodBag.VerificationDoctorRemarks);
                sqlDB.AddInParameter(dbCMD, "OutPatientID", SqlDbType.Int, modelBloodBag.OutPatientID);
                sqlDB.AddInParameter(dbCMD, "Status ", SqlDbType.NVarChar, "InStock");
                sqlDB.AddInParameter(dbCMD, "DonateDate", SqlDbType.DateTime, modelBloodBag.DonateDate);
                sqlDB.AddInParameter(dbCMD, "ExpireDate", SqlDbType.DateTime, modelBloodBag.ExpireDate);
                sqlDB.AddInParameter(dbCMD, "Description", SqlDbType.NVarChar, modelBloodBag.Description);
                sqlDB.AddInParameter(dbCMD, "UserID", SqlDbType.Int, CommonVariables.UserID());
                sqlDB.ExecuteNonQuery(dbCMD);
            }
            catch (Exception ex)
            {
            }
        }

        #endregion

        #region PR_BloodBag_SelectAll
        public DataTable PR_BloodBag_SelectAll()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodBag_SelectAll");
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

        #region PR_BloodBag_SelectByPK
        public DataTable PR_BloodBag_SelectByPK(int? BloodBagSerialNumber)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodBag_SelectByPK");
                sqlDB.AddInParameter(dbCMD, "BloodBagSearialNumber", DbType.Int32, BloodBagSerialNumber);
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

        #region PR_BloodBag_DeleteByPK
        public void PR_BloodBag_DeleteByPK(int BloodBagSerialNumber)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodBag_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "BloodBagSearialNumber", DbType.Int32, BloodBagSerialNumber);
                sqlDB.ExecuteNonQuery(dbCMD);
            }
            catch (Exception ex)
            {
            }
        }

        #endregion

        #region PR_BloodBag_UpdateByPKUserID
        public void PR_BloodBag_UpdateByPKUserID(BloodBagModel modelBloodBag)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodBag_UpdateByPKUserID");
            sqlDB.AddInParameter(dbCMD, "BloodBagSerialNumber ", SqlDbType.Int, modelBloodBag.BloodBagSerialNumber);
            sqlDB.AddInParameter(dbCMD, "BloodGroupID ", SqlDbType.Int, modelBloodBag.BloodGroupID);
            sqlDB.AddInParameter(dbCMD, "DonorID", SqlDbType.Int, modelBloodBag.DonorID);
            sqlDB.AddInParameter(dbCMD, "VerifiedDoctorID", SqlDbType.Int, modelBloodBag.VerifiedDoctorID);
            sqlDB.AddInParameter(dbCMD, "VerificationDoctorRemarks ", SqlDbType.NVarChar, modelBloodBag.VerificationDoctorRemarks);
            sqlDB.AddInParameter(dbCMD, "OutPatientID", SqlDbType.Int, modelBloodBag.OutPatientID);
            sqlDB.AddInParameter(dbCMD, "Status ", SqlDbType.NVarChar, "InStock");
            sqlDB.AddInParameter(dbCMD, "DonateDate", SqlDbType.DateTime, modelBloodBag.DonateDate);
            sqlDB.AddInParameter(dbCMD, "ExpireDate", SqlDbType.DateTime, modelBloodBag.ExpireDate);
            sqlDB.AddInParameter(dbCMD, "Description", SqlDbType.NVarChar, modelBloodBag.Description);
            sqlDB.AddInParameter(dbCMD, "UserID", SqlDbType.Int, CommonVariables.UserID());
            sqlDB.ExecuteNonQuery(dbCMD);
            }
            catch (Exception ex)
            {
            }
        }

        #endregion
    }
}
