using BloodBankProject.Areas.BloodGroup.Models;
using BloodBankProject.Areas.City.Models;
using BloodBankProject.Areas.State.Models;
using BloodBankProject.DAL;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace BloodBankProject.Controllers
{
    public class DonorController : Controller
    {
        #region DonorList
        public IActionResult Index()
        {
            LOC_DAL dalLOC = new LOC_DAL();
            Donor_DAL dalDonor = new Donor_DAL();
            BloodGroup_DAL dalBloodGroup = new BloodGroup_DAL();
            DataTable dtDonor = dalDonor.PR_Donor_SelectAll();

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

            #region Here Blood Group Drop Down are Passed For Add/Edit Mode
            DataTable dtBloodGroupDropDownList = dalBloodGroup.PR_BloodGroupSelectForDropDownList();
            List<BloodGroupDropDownModel> BloodGroupDropDownList = new List<BloodGroupDropDownModel>();
            if (dtBloodGroupDropDownList.Rows.Count > 0)
            {
                foreach (DataRow drBloodGroupDropDown in dtBloodGroupDropDownList.Rows)
                {
                    BloodGroupDropDownModel BloodGroupDropDown = new BloodGroupDropDownModel();
                    if ((int)drBloodGroupDropDown["BloodGroupID"] != 0)
                    {
                        BloodGroupDropDown.BloodGroupID = (int)drBloodGroupDropDown["BloodGroupID"];
                    }
                    if ((string)drBloodGroupDropDown["BloodGroupName"].ToString().Trim() != null)
                    {
                        BloodGroupDropDown.BloodGroupName = (string)drBloodGroupDropDown["BloodGroupName"].ToString().Trim();
                    }
                    BloodGroupDropDownList.Add(BloodGroupDropDown);
                }
                ViewBag.BloodGroupDropDownList = BloodGroupDropDownList;
            }

            #endregion

            List<CityDropDownModel> CityDropDown = new List<CityDropDownModel>();
            ViewBag.CityDropDownList = CityDropDown;

            return View("DonorList", dtDonor);
        }
        #endregion
    }

}
