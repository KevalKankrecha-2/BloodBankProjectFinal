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
using BloodBankProject.Areas.Doctor.Models;

namespace BloodBankProject.DAL
{
    public class Doctor_DALBASE : DALHelper
    {

        #region PR_Doctor_SelectAll
        public DataTable PR_Doctor_SelectAll()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Doctor_SelectAll");
                DataTable dtDoctor = new DataTable();
                using (IDataReader drDoctor = sqlDB.ExecuteReader(dbCMD))
                {
                    dtDoctor.Load(drDoctor);
                }
                return dtDoctor;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region PR_Doctor_SelectByPK
        public DataTable PR_Doctor_SelectByPK(int? DoctorID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Doctor_SelectByPK");
                sqlDB.AddInParameter(dbCMD, "DoctorID", SqlDbType.Int, DoctorID);
                DataTable dtDoctor = new DataTable();
                using (IDataReader drDoctor = sqlDB.ExecuteReader(dbCMD))
                {
                    dtDoctor.Load(drDoctor);
                }
                return dtDoctor;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion*/

        #region PR_Doctor_DeleteByPK
        public void PR_Doctor_DeleteByPK(int DoctorID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Doctor_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "DoctorID", SqlDbType.Int, DoctorID);
                DataTable dtDoctor = new DataTable();
                sqlDB.ExecuteNonQuery(dbCMD);
            }
            catch (Exception ex)
            {
            }
        }

        #endregion

        #region PR_Doctor_InsertByUserID
        public void PR_Doctor_InsertByUserID(DoctorModel modelDoctor)
        {
            /*try
            {*/
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Doctor_InsertByUserID");
                sqlDB.AddInParameter(dbCMD, "DoctorName", SqlDbType.NVarChar, modelDoctor.DoctorName);
                sqlDB.AddInParameter(dbCMD, "ContactNumber", SqlDbType.NVarChar, modelDoctor.ContactNumber);
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, modelDoctor.StateID);
                sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.Int, modelDoctor.CityID);
                sqlDB.AddInParameter(dbCMD, "Address", SqlDbType.NVarChar, modelDoctor.Address);
                sqlDB.AddInParameter(dbCMD, "Gender", SqlDbType.NVarChar, modelDoctor.Gender);
                sqlDB.AddInParameter(dbCMD, "Email", SqlDbType.NVarChar, modelDoctor.Email);
                sqlDB.AddInParameter(dbCMD, "BirthDate", SqlDbType.DateTime, modelDoctor.BirthDate);
                sqlDB.AddInParameter(dbCMD, "Description", SqlDbType.NVarChar, modelDoctor.Description);
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

        #region PR_Doctor_UpdateByPKUserID
        public void PR_Doctor_UpdateByPKUserID(DoctorModel modelDoctor)
        {
            /*try
            {*/
            SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Doctor_UpdateByPKUserID");
            sqlDB.AddInParameter(dbCMD, "DoctorName", SqlDbType.NVarChar, modelDoctor.DoctorName);
            sqlDB.AddInParameter(dbCMD, "DoctorID", SqlDbType.Int, modelDoctor.DoctorID);
            sqlDB.AddInParameter(dbCMD, "ContactNumber", SqlDbType.NVarChar, modelDoctor.ContactNumber);
            sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, modelDoctor.StateID);
            sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.Int, modelDoctor.CityID);
            sqlDB.AddInParameter(dbCMD, "Address", SqlDbType.NVarChar, modelDoctor.Address);
            sqlDB.AddInParameter(dbCMD, "Gender", SqlDbType.NVarChar, modelDoctor.Gender);
            sqlDB.AddInParameter(dbCMD, "Email", SqlDbType.NVarChar, modelDoctor.Email);
            sqlDB.AddInParameter(dbCMD, "BirthDate", SqlDbType.DateTime, modelDoctor.BirthDate);
            sqlDB.AddInParameter(dbCMD, "Description", SqlDbType.NVarChar, modelDoctor.Description);
            sqlDB.AddInParameter(dbCMD, "UserID", SqlDbType.Int, CommonVariables.UserID());
            sqlDB.AddInParameter(dbCMD, "ModificationDate", SqlDbType.DateTime, DBNull.Value);
            sqlDB.ExecuteNonQuery(dbCMD);
          /* }
            catch (Exception ex)
            {
            }*/
        }

        #endregion*/

    }
}


