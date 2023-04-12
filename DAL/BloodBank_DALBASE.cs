using BloodBankProject.Areas.BloodBank.Models;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using BloodBankProject.BAL;
using System.Linq;
using System.Threading.Tasks;

namespace BloodBankProject.DAL
{
    public class BloodBank_DALBASE : DALHelper
    {
        #region PR_BloodBank_InsertByUserID
        public void PR_BloodBank_InsertByUserID(BloodBankModel modelBloodBank)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodBank_InsertByUserID");
                sqlDB.AddInParameter(dbCMD, "BloodBankName", SqlDbType.NVarChar, modelBloodBank.BloodBankName);
                sqlDB.AddInParameter(dbCMD, "ContactNumber", SqlDbType.NVarChar, modelBloodBank.ContactNumber);
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, modelBloodBank.StateID);
                sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.Int, modelBloodBank.CityID);
                sqlDB.AddInParameter(dbCMD, "Address", SqlDbType.NVarChar, modelBloodBank.Address);
                sqlDB.AddInParameter(dbCMD, "Email", SqlDbType.NVarChar, modelBloodBank.Email);
                sqlDB.AddInParameter(dbCMD, "EastablishmentDate", SqlDbType.DateTime, modelBloodBank.EstablishmentDate);
                sqlDB.AddInParameter(dbCMD, "Latitude", SqlDbType.NVarChar, modelBloodBank.Latitude);
                sqlDB.AddInParameter(dbCMD, "Longtitude", SqlDbType.NVarChar, modelBloodBank.Longtitude);
                sqlDB.AddInParameter(dbCMD, "Description", SqlDbType.NVarChar, modelBloodBank.Description);
                sqlDB.AddInParameter(dbCMD, "Image", SqlDbType.NVarChar, modelBloodBank.Image);
                sqlDB.AddInParameter(dbCMD, "UserID", SqlDbType.Int, CommonVariables.UserID());

                DataTable dtState = new DataTable();
                sqlDB.ExecuteNonQuery(dbCMD);

            }
            catch (Exception ex)
            {
            }
        }

        #endregion

        #region PR_BloodBank_UpdateByPKUserID
        public void PR_BloodBank_UpdateByPKUserID(BloodBankModel modelBloodBank)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodBank_UpdateByPKUserID");
                sqlDB.AddInParameter(dbCMD, "BloodBankName", SqlDbType.NVarChar, modelBloodBank.BloodBankName);
                sqlDB.AddInParameter(dbCMD, "ContactNumber", SqlDbType.NVarChar, modelBloodBank.ContactNumber);
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, modelBloodBank.StateID);
                sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.Int, modelBloodBank.CityID);
                sqlDB.AddInParameter(dbCMD, "Address", SqlDbType.NVarChar, modelBloodBank.Address);
                sqlDB.AddInParameter(dbCMD, "Email", SqlDbType.NVarChar, modelBloodBank.Email);
                sqlDB.AddInParameter(dbCMD, "EstablishmentDate", SqlDbType.DateTime, modelBloodBank.EstablishmentDate);
                sqlDB.AddInParameter(dbCMD, "Latitude", SqlDbType.NVarChar, modelBloodBank.Latitude);
                sqlDB.AddInParameter(dbCMD, "Longtitude", SqlDbType.NVarChar, modelBloodBank.Longtitude);
                sqlDB.AddInParameter(dbCMD, "Description", SqlDbType.NVarChar, modelBloodBank.Description);
                sqlDB.AddInParameter(dbCMD, "Image", SqlDbType.NVarChar, modelBloodBank.Image);
                sqlDB.AddInParameter(dbCMD, "ModificationDate", SqlDbType.DateTime, DBNull.Value);
                sqlDB.AddInParameter(dbCMD, "UserID", SqlDbType.Int, CommonVariables.UserID());
                sqlDB.AddInParameter(dbCMD, "BloodBankID", SqlDbType.Int, modelBloodBank.BloodBankID);
                DataTable dtState = new DataTable();
                sqlDB.ExecuteNonQuery(dbCMD);

            }
            catch (Exception ex)
            {
            }
        }

        #endregion

        #region PR_BloodBank_SelectAll
        public DataTable PR_BloodBank_SelectAll()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodBank_SelectAll");
                DataTable dtBloodBank = new DataTable();
                using (IDataReader drBlooBank = sqlDB.ExecuteReader(dbCMD))
                {
                    dtBloodBank.Load(drBlooBank);
                }
                return dtBloodBank;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region PR_BloodBank_SelectByPK
        public DataTable PR_BloodBank_SelectByPK(int? BloodBankID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_BloodBank_SelectByPK");
                sqlDB.AddInParameter(dbCMD, "BloodBank", SqlDbType.Int, BloodBankID);
                DataTable dtBloodBank = new DataTable();
                using (IDataReader drBlooBank = sqlDB.ExecuteReader(dbCMD))
                {
                    dtBloodBank.Load(drBlooBank);
                }
                return dtBloodBank;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

    }
}
