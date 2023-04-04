using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using BloodBankProject.DAL;
using BloodBankProject.Areas.State.Models;
using BloodBankProject.Areas.City.Models;

using BloodBankProject.BAL;
using BloodBankProject.Areas.Donor.Models;

namespace BloodBankProject.DAL
{
    public class Donor_DALBASE : DALHelper
    {

        #region PR_Donor_SelectAll
        public DataTable PR_Donor_SelectAll()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Donor_SelectAll");
                DataTable dtDonor = new DataTable();
                using (IDataReader drDonor = sqlDB.ExecuteReader(dbCMD))
                {
                    dtDonor.Load(drDonor);
                }
                return dtDonor;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region PR_Donor_SelectByPK
        public DataTable PR_Donor_SelectByPK(int? DonorID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Donor_SelectByPK");
                sqlDB.AddInParameter(dbCMD, "DonorID", SqlDbType.Int, DonorID);
                DataTable dtDonor = new DataTable();
                using (IDataReader drDonor = sqlDB.ExecuteReader(dbCMD))
                {
                    dtDonor.Load(drDonor);
                }
                return dtDonor;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region PR_Donor_DeleteByPK
        public void PR_Donor_DeleteByPK(int DonorID)
        {
            /*try
            {*/
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Donor_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "DonorID", SqlDbType.Int, DonorID);
                DataTable dtDonor = new DataTable();
                sqlDB.ExecuteNonQuery(dbCMD);
           /* }
            catch (Exception ex)
            {
            }*/
        }

        #endregion

        #region PR_Donor_InsertByUserID
        public void PR_Donor_InsertByUserID(DonorModel modelDonor)
        {
            /*try
            {*/
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Donor_InsertByUserID");
                sqlDB.AddInParameter(dbCMD, "DonorName", SqlDbType.NVarChar, modelDonor.DonorName);
                sqlDB.AddInParameter(dbCMD, "ContactNumber", SqlDbType.NVarChar, modelDonor.ContactNumber);
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, modelDonor.StateID);
                sqlDB.AddInParameter(dbCMD, "BloodGroupID", SqlDbType.Int, modelDonor.BloodGroupID);
                sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.Int, modelDonor.CityID);
                sqlDB.AddInParameter(dbCMD, "Address", SqlDbType.NVarChar, modelDonor.Address);
                sqlDB.AddInParameter(dbCMD, "Gender", SqlDbType.NVarChar, modelDonor.Gender);
                sqlDB.AddInParameter(dbCMD, "ProofType", SqlDbType.NVarChar, modelDonor.ProofType);
                sqlDB.AddInParameter(dbCMD, "Pulse", SqlDbType.NVarChar, modelDonor.Pulse);
                sqlDB.AddInParameter(dbCMD, "BP", SqlDbType.NVarChar, modelDonor.BP);
                sqlDB.AddInParameter(dbCMD, "Weight", SqlDbType.Decimal, modelDonor.Weight);
                sqlDB.AddInParameter(dbCMD, "ProofNumber", SqlDbType.NVarChar, modelDonor.ProofNumber);
                sqlDB.AddInParameter(dbCMD, "Email", SqlDbType.NVarChar, modelDonor.Email);
                sqlDB.AddInParameter(dbCMD, "BirthDate", SqlDbType.DateTime, modelDonor.BirthDate);
                sqlDB.AddInParameter(dbCMD, "Description", SqlDbType.NVarChar, modelDonor.Description);
                sqlDB.AddInParameter(dbCMD, "Image", SqlDbType.NVarChar, modelDonor.Image);
                sqlDB.AddInParameter(dbCMD, "UserID", SqlDbType.Int, CommonVariables.UserID());
                sqlDB.AddInParameter(dbCMD, "CreationDate", SqlDbType.DateTime, DBNull.Value);
                sqlDB.AddInParameter(dbCMD, "ModificationDate", SqlDbType.DateTime, DBNull.Value);
                sqlDB.ExecuteNonQuery(dbCMD);
            /*}
            catch (Exception ex)
            {
            }*/
        }

        #endregion

        #region PR_Donor_UpdateByPKUserID
        public void PR_Donor_UpdateByPKUserID(DonorModel modelDonor)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Donor_UpdateByPKUserID");
            sqlDB.AddInParameter(dbCMD, "DonorName", SqlDbType.NVarChar, modelDonor.DonorName);
            sqlDB.AddInParameter(dbCMD, "DonorID", SqlDbType.Int, modelDonor.DonorID);
            sqlDB.AddInParameter(dbCMD, "ContactNumber", SqlDbType.NVarChar, modelDonor.ContactNumber);
            sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, modelDonor.StateID);
            sqlDB.AddInParameter(dbCMD, "BloodGroupID", SqlDbType.Int, modelDonor.BloodGroupID);
            sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.Int, modelDonor.CityID);
            sqlDB.AddInParameter(dbCMD, "Address", SqlDbType.NVarChar, modelDonor.Address);
            sqlDB.AddInParameter(dbCMD, "Gender", SqlDbType.NVarChar, modelDonor.Gender);
            sqlDB.AddInParameter(dbCMD, "ProofType", SqlDbType.NVarChar, modelDonor.ProofType);
            sqlDB.AddInParameter(dbCMD, "Pulse", SqlDbType.NVarChar, modelDonor.Pulse);
            sqlDB.AddInParameter(dbCMD, "BP", SqlDbType.NVarChar, modelDonor.BP);
            sqlDB.AddInParameter(dbCMD, "Weight", SqlDbType.Decimal, modelDonor.Weight);
            sqlDB.AddInParameter(dbCMD, "ProofNumber", SqlDbType.NVarChar, modelDonor.ProofNumber);
            sqlDB.AddInParameter(dbCMD, "Email", SqlDbType.NVarChar, modelDonor.Email);
            sqlDB.AddInParameter(dbCMD, "BirthDate", SqlDbType.DateTime, modelDonor.BirthDate);
            sqlDB.AddInParameter(dbCMD, "Description", SqlDbType.NVarChar, modelDonor.Description);
            sqlDB.AddInParameter(dbCMD, "Image", SqlDbType.NVarChar, modelDonor.Image);
            sqlDB.AddInParameter(dbCMD, "UserID", SqlDbType.Int, CommonVariables.UserID());
            sqlDB.AddInParameter(dbCMD, "ModificationDate", SqlDbType.DateTime, DBNull.Value);
            sqlDB.ExecuteNonQuery(dbCMD);
            }
            catch (Exception ex)
            {
            }
        }

        #endregion

    }
}


