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

namespace BloodBankProject.DAL
{
    public class LOC_DALBASE : DALHelper
    {
        #region PR_State_SelectAll
        public DataTable PR_State_SelectAll()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_State_SelectAll");
                DataTable dtState = new DataTable();
                using (IDataReader drState = sqlDB.ExecuteReader(dbCMD))
                {
                    dtState.Load(drState);
                }
                return dtState;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region PR_State_InsertByUserID
        public void PR_State_InsertByUserID(StateModel modelState)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_State_InsertByUserID");
                sqlDB.AddInParameter(dbCMD, "StateName", SqlDbType.NVarChar, modelState.StateName.Trim());
                sqlDB.AddInParameter(dbCMD, "StateCode", SqlDbType.NVarChar, modelState.StateCode.Trim());
                /*sqlDB.AddInParameter(dbCMD, "UserID", SqlDbType.Int, CommonVariables.UserID());*/
                sqlDB.AddInParameter(dbCMD, "Description", SqlDbType.NVarChar, modelState.Description);
                sqlDB.AddInParameter(dbCMD, "CreationDate", SqlDbType.DateTime, DBNull.Value);
                sqlDB.AddInParameter(dbCMD, "ModificationDate", SqlDbType.DateTime, DBNull.Value);
                sqlDB.ExecuteNonQuery(dbCMD);
            }
            catch (Exception ex)
            {

            }
        }

        #endregion

        #region PR_State_DeleteByPK
        public void PR_State_DeleteByPK(int StateID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_State_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.NVarChar, StateID);
                sqlDB.ExecuteNonQuery(dbCMD);
            }
            catch (Exception ex)
            {
            }
        }

        #endregion

        #region PR_State_SelectByPK
        public DataTable PR_State_SelectByPK(int? StateID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_State_SelectByPK");
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, StateID);
                DataTable dtStateByPK = new DataTable();
                using (IDataReader drStateByPK = sqlDB.ExecuteReader(dbCMD))
                {
                    dtStateByPK.Load(drStateByPK);
                }
                return dtStateByPK;
            }

            catch (Exception ex)
            {
                return null;
            }

        }
        #endregion

        #region PR_State_UpdateByPKUserID
        public void PR_State_UpdateByPKUserID(StateModel modelState)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_State_UpdateByPKUserID");
                sqlDB.AddInParameter(dbCMD, "StateName", SqlDbType.NVarChar, modelState.StateName);
                sqlDB.AddInParameter(dbCMD, "StateCode", SqlDbType.NVarChar, modelState.StateCode);
                /*sqlDB.AddInParameter(dbCMD, "UserID", SqlDbType.Int, CommonVariables.UserID());*/
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, modelState.StateID);
                sqlDB.AddInParameter(dbCMD, "Description", SqlDbType.NVarChar, modelState.Description);
                sqlDB.AddInParameter(dbCMD, "ModificationDate", SqlDbType.DateTime, DBNull.Value);
                sqlDB.ExecuteNonQuery(dbCMD);
            }
            catch (Exception ex)
            {

            }
        }

        #endregion


        #region PR_City_SelectAll
        public DataTable PR_City_SelectAll()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_City_SelectAll");
                DataTable dtCity = new DataTable();
                using (IDataReader drCity = sqlDB.ExecuteReader(dbCMD))
                {
                    dtCity.Load(drCity);
                }
                return dtCity;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region PR_City_SelectByPK
        public DataTable PR_City_SelectByPK(int? CityID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_City_SelectByPK");
                sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.Int, CityID);
                DataTable dtcityByPK = new DataTable();
                using (IDataReader drcityByPK = sqlDB.ExecuteReader(dbCMD))
                {
                    dtcityByPK.Load(drcityByPK);
                }
                return dtcityByPK;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        #endregion

        #region PR_City_DeleteByPK
        public void PR_City_DeleteByPK(int CityID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_City_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.NVarChar, CityID);
                sqlDB.ExecuteNonQuery(dbCMD);
            }
            catch (Exception ex)
            {
            }
        }

        #endregion

        #region PR_City_InsertByUserID
        public void PR_City_InsertByUserID(CityModel modelCity)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_City_InsertByUserID");
                sqlDB.AddInParameter(dbCMD, "CityName", SqlDbType.NVarChar, modelCity.CityName.Trim());
                sqlDB.AddInParameter(dbCMD, "CityCode", SqlDbType.NVarChar, modelCity.CityCode.Trim());
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, modelCity.StateID);
                sqlDB.AddInParameter(dbCMD, "Description", SqlDbType.NVarChar, modelCity.Description);
                sqlDB.AddInParameter(dbCMD, "CreationDate", SqlDbType.DateTime, DBNull.Value);
                sqlDB.AddInParameter(dbCMD, "ModificationDate", SqlDbType.DateTime, DBNull.Value);
                sqlDB.AddInParameter(dbCMD, "UserID", SqlDbType.Int, CommonVariables.UserID());

                sqlDB.ExecuteNonQuery(dbCMD);
            }
            catch (Exception ex)
            {
            }
        }
        #endregion

        #region PR_City_UpdateByPKUserID
        public void PR_City_UpdateByPKUserID(CityModel modelCity)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(myConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_City_UpdateByPKUserID");
                sqlDB.AddInParameter(dbCMD, "CityName", SqlDbType.NVarChar, modelCity.CityName.Trim());
                sqlDB.AddInParameter(dbCMD, "CityCode", SqlDbType.NVarChar, modelCity.CityCode.Trim());
                sqlDB.AddInParameter(dbCMD, "StateID", SqlDbType.Int, modelCity.StateID);
                sqlDB.AddInParameter(dbCMD, "Description", SqlDbType.NVarChar, modelCity.Description);
                sqlDB.AddInParameter(dbCMD, "ModificationDate", SqlDbType.DateTime, DBNull.Value);
                sqlDB.AddInParameter(dbCMD, "UserID", SqlDbType.Int, CommonVariables.UserID());
                sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.Int, modelCity.CityID);
                sqlDB.ExecuteNonQuery(dbCMD);
            }
            catch (Exception ex)
            {
            }
        }
        #endregion*/
    }
}


