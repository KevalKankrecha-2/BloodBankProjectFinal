using BloodBankProject.Areas.City.Models;
using BloodBankProject.Areas.Doctor.Models;
using BloodBankProject.Areas.State.Models;
using BloodBankProject.DAL;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace BloodBankProject.Areas.Doctor
{
    [Area("Doctor")]
    [Route("Doctor/[controller]/[action]")]
    public class DoctorController : Controller
    {
        #region DoctorList
        public IActionResult Index()
        {
            Doctor_DAL dalDoctor = new Doctor_DAL();
            DataTable dtDoctor = dalDoctor.PR_Doctor_SelectAll();
            return View("DoctorList", dtDoctor);
        }
        #endregion

        [HttpPost]
        #region OpenForm
        public IActionResult Add(int? DoctorID)
        {
            LOC_DAL dalLOC = new LOC_DAL();
            Doctor_DAL dalDoctor = new Doctor_DAL();
            DoctorModel modelDoctor = new DoctorModel();
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

            List<CityDropDownModel> CityDropDown = new List<CityDropDownModel>();
            ViewBag.CityDropDownList = CityDropDown;


            if (DoctorID != null)
            {
                DataTable dtDonorByPK = dalDoctor.PR_Doctor_SelectByPK(DoctorID);
                #region Select By PK

                if (dtDonorByPK.Rows.Count == 1)
                {
                    foreach (DataRow drBloodBank in dtDonorByPK.Rows)
                    {
                        modelDoctor.DoctorID = Convert.ToInt32(drBloodBank["DoctorID"]);
                        modelDoctor.DoctorName = Convert.ToString(drBloodBank["DoctorName"]);
                        modelDoctor.StateID = Convert.ToInt32(drBloodBank["StateID"]);
                        modelDoctor.CityID = Convert.ToInt32(drBloodBank["CityID"]);
                        modelDoctor.BirthDate = Convert.ToDateTime(drBloodBank["BirthDate"]);
                        modelDoctor.Address = Convert.ToString(drBloodBank["Address"]);
                        modelDoctor.Description = Convert.ToString(drBloodBank["Description"]);
                        modelDoctor.Email = Convert.ToString(drBloodBank["Email"]);
                        modelDoctor.ContactNumber = Convert.ToString(drBloodBank["ContactNumber"]);
                        modelDoctor.Gender = Convert.ToString(drBloodBank["Gender"]);
                    }

                }
                #endregion

                #region Get City From State in update
                DataTable dt = dalLOC.PR_City_SelectForDropDownListByStateID(modelDoctor.StateID);
                List<CityDropDownModel> CityDropDownList = new List<CityDropDownModel>();
                foreach (DataRow dr in dt.Rows)
                {
                    CityDropDownModel dropdown = new CityDropDownModel();
                    dropdown.CityID = Convert.ToInt32(dr["CityID"]);
                    dropdown.CityName = dr["CityName"].ToString();
                    CityDropDownList.Add(dropdown);
                }
                ViewBag.CityDropDownList = CityDropDownList;
                #endregion
            }

            return View("DoctorAddEdit",modelDoctor);
        }
        #endregion

        [HttpPost]
        #region Perfom Add/Edit
        public IActionResult Save(DoctorModel modelDoctor)
        {
            Doctor_DAL dalDoctor = new Doctor_DAL();
            if (modelDoctor.DoctorID == null)
            {
                dalDoctor.PR_Doctor_InsertByUserID(modelDoctor);
            }
            else
            {
                dalDoctor.PR_Doctor_UpdateByPKUserID(modelDoctor);
            }
            return RedirectToAction("Index");
        }
        #endregion

        #region Delete Doctor
        public IActionResult Delete(int DoctorID)
        {
            Doctor_DAL dalDoctor = new Doctor_DAL();
            dalDoctor.PR_Doctor_DeleteByPK(DoctorID);
            return RedirectToAction("Index");
        }
        #endregion

        #region City From State
        [HttpPost]
        public IActionResult CityDropdownListByStateID(int StateID)
        {
            LOC_DAL dalLOC = new LOC_DAL();
            DataTable dt = dalLOC.PR_City_SelectForDropDownListByStateID(StateID);
            List<CityDropDownModel> CityDropDownList = new List<CityDropDownModel>();
            foreach (DataRow dr in dt.Rows)
            {
                CityDropDownModel dropdown = new CityDropDownModel();
                dropdown.CityID = Convert.ToInt32(dr["CityID"]);
                dropdown.CityName = dr["CityName"].ToString();
                CityDropDownList.Add(dropdown);
            }
            var vModel = CityDropDownList;
            return Json(vModel);
        }
        #endregion
    }
}
