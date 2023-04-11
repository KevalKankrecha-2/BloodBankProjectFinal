using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using BloodBankProject.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using BloodBankProject.Areas.City.Models;
using BloodBankProject.Areas.State.Models;
using BloodBankProject.BAL;
namespace BloodBankProject.Areas.City.Controllers
{
    [CheckAccess]
    [Area("City")]
    [Route("City/[controller]/[action]")]
    public class CityController : Controller
    {
        #region CityList
        public ActionResult Index()
        {
            LOC_DAL dalLOC = new LOC_DAL();
            DataTable dtCity = dalLOC.PR_City_SelectAll();
            return View("CityList", dtCity);
        }
        #endregion

        #region AddEdit
        public ActionResult AddEdit(int? CityID)
        {
            CityModel modelCity = new CityModel();
            LOC_DAL dalLOC = new LOC_DAL();

            #region Here State Drop Down are Passed For Add/Edit Mode
            DataTable dtStateDropDownList = dalLOC.PR_State_SelectForDropDownList();
            List<StateDropDownModel> StateDropDownList = new List<StateDropDownModel>();
            if (dtStateDropDownList.Rows.Count > 0)
            {
                foreach (DataRow drStateDropDown in dtStateDropDownList.Rows)
                {
                    StateDropDownModel CountryDropDown = new StateDropDownModel();
                    if ((int)drStateDropDown["StateID"] != 0)
                    {
                        CountryDropDown.StateID = (int)drStateDropDown["StateID"];
                    }
                    if ((string)drStateDropDown["StateName"].ToString().Trim() != null)
                    {
                        CountryDropDown.StateName = (string)drStateDropDown["StateName"].ToString().Trim();
                    }
                    StateDropDownList.Add(CountryDropDown);
                }
                ViewBag.StateDropDownList = StateDropDownList;
            }

            #endregion

            #region Select City By PK
            if (CityID != null)
            {
                DataTable dtCity = dalLOC.PR_City_SelectByPK(CityID);
                if (dtCity.Rows.Count == 1)
                {
                    foreach (DataRow drCity in dtCity.Rows)
                    {
                        modelCity.StateID = Convert.ToInt32(drCity["StateID"]);
                        modelCity.CityID = Convert.ToInt32(drCity["CityID"]);
                        modelCity.CityName = Convert.ToString(drCity["CityName"]);
                        modelCity.CityCode = Convert.ToString(drCity["CityCode"]);
                        modelCity.Description = Convert.ToString(drCity["Description"]);
                    }
                }
            }
            return View("CityAddEdit", modelCity);
            #endregion
        }
        #endregion

        #region Save
        [HttpPost]
        public ActionResult Save(CityModel modelCity)
        {
            LOC_DAL dalLOC = new LOC_DAL();
            if (modelCity.CityID == null)
            {
                if(modelCity.StateID !=0 && modelCity.CityName!=null)
                {
                    dalLOC.PR_City_InsertByUserID(modelCity);
                }
            }
            else
            {
                if (modelCity.StateID != 0 && modelCity.CityName != null)
                {
                    dalLOC.PR_City_UpdateByPKUserID(modelCity);
                }
            }
            return RedirectToAction("Index");
        }
        #endregion

        #region Delete
        public IActionResult Delete(int CityID)
        {
            LOC_DAL dalLoc = new LOC_DAL();
            dalLoc.PR_City_DeleteByPK(CityID);
            return RedirectToAction("Index");
        }
        #endregion
    }
}
