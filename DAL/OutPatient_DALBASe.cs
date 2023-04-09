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
using BloodBankProject.Areas.OutPatient.Models;

namespace BloodBankProject.DAL
{
    public class OutPatient_DALBASE : DALHelper
    {
        #region PR_OutPatient_SelectAll
        public DataTable PR_OutPatient_SelectAll()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_OutPatient_SelectAll");
                DataTable dtOutPatient = new DataTable();
                using (IDataReader drOutPatient = sqlDB.ExecuteReader(dbCMD))
                {
                    dtOutPatient.Load(drOutPatient);
                }
                return dtOutPatient;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region PR_OutPatient_SelectByPK
        public DataTable PR_OutPatient_SelectByPK(int? OutPatientID)
        {
          /*  try
            {*/
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_OutPatient_SelectByPK");
                sqlDB.AddInParameter(dbCMD, "OutPatientID", SqlDbType.Int, OutPatientID);
                DataTable dtOutPatient = new DataTable();
                using (IDataReader drOutPatient = sqlDB.ExecuteReader(dbCMD))
                {
                    dtOutPatient.Load(drOutPatient);
                }
                return dtOutPatient;
            /*}
            catch (Exception ex)
            {
                return null;
            }*/
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

        #region PR_OutPatient_InsertByUserID
        public DataTable PR_OutPatient_InsertByUserID(OutPatientModel modelOutPatient)
        {
            /*try
            {*/
            SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_OutPatient_InsertByUserID");
            sqlDB.AddInParameter(dbCMD, "OutPatientName", SqlDbType.NVarChar, modelOutPatient.OutPatientName);
            sqlDB.AddInParameter(dbCMD, "ContactNumber", SqlDbType.NVarChar, modelOutPatient.ContactNumber);
            sqlDB.AddInParameter(dbCMD, "BloodGroupID", SqlDbType.Int, modelOutPatient.BloodGroupID); ;
            sqlDB.AddInParameter(dbCMD, "Quantity", SqlDbType.Int, modelOutPatient.Quantity);
            sqlDB.AddInParameter(dbCMD, "TotalPrice", SqlDbType.Decimal, modelOutPatient.TotalPrice);
            sqlDB.AddInParameter(dbCMD, "Price", SqlDbType.Decimal, modelOutPatient.Price);
            sqlDB.AddInParameter(dbCMD, "BloodCrossVerifiedBy", SqlDbType.Int, modelOutPatient.BloodCrossVerifiedBy);
            sqlDB.AddInParameter(dbCMD, "DoctorCrossVerificationRemarks", SqlDbType.NVarChar, modelOutPatient.DoctorCrossVerificationRemarks); 
            sqlDB.AddInParameter(dbCMD, "OutDate", SqlDbType.DateTime, modelOutPatient.OutDate);
            sqlDB.AddInParameter(dbCMD, "Description", SqlDbType.NVarChar, modelOutPatient.Description);
            sqlDB.AddInParameter(dbCMD, "UserID", SqlDbType.Int, CommonVariables.UserID());
            DataTable dtOutPatient = new DataTable();
            using (IDataReader drOutPatient = sqlDB.ExecuteReader(dbCMD))
            {
                dtOutPatient.Load(drOutPatient);
            }
            return dtOutPatient;
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
                sqlDB.ExecuteNonQuery(dbCMD);
            }
            catch (Exception ex)
            {
            }
        }

        #endregion

    }
}


