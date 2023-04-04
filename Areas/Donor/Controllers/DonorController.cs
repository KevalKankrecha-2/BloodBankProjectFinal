using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using BloodBankProject.DAL;
using BloodBankProject.Areas.State.Models;
using BloodBankProject.Areas.City.Models;
using BloodBankProject.Areas.BloodGroup.Models;
using BloodBankProject.Areas.Donor.Models;
using System.IO;

namespace BloodBank.Areas.Donor.Controllers
{
    [Area("Donor")]
    [Route("Donor/[controller]/[action]")]
    public class DonorController : Controller
    {
        #region DonorList
        public IActionResult Index()
        {
            Donor_DAL dalDonor = new Donor_DAL();
            DataTable dtDonor = dalDonor.PR_Donor_SelectAll();
            return View("DonorList",dtDonor);
        }
        #endregion

        #region Open Add/Edit Form
        public IActionResult Add(int? DonorID)
        {
            DonorModel modelDonor = new DonorModel();
            Donor_DAL dalDonor = new Donor_DAL();
            BloodGroup_DAL dalBloodGroup = new BloodGroup_DAL();
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

            if (DonorID != null)
            {
                DataTable dtDonorByPK = dalDonor.PR_Donor_SelectByPK(DonorID);
                #region Select By PK

                if (dtDonorByPK.Rows.Count == 1)
                {
                    foreach (DataRow drBloodBank in dtDonorByPK.Rows)
                    {
                        modelDonor.DonorID = Convert.ToInt32(drBloodBank["DonorID"]);
                        modelDonor.DonorName= Convert.ToString(drBloodBank["DonorName"]);
                        modelDonor.StateID = Convert.ToInt32(drBloodBank["StateID"]);
                        modelDonor.CityID = Convert.ToInt32(drBloodBank["CityID"]);
                        modelDonor.BloodGroupID = Convert.ToInt32(drBloodBank["BloodGroupID"]);
                        modelDonor.Pulse= Convert.ToString(drBloodBank["BloodGroupID"]);
                        modelDonor.BP = Convert.ToString(drBloodBank["BP"]);
                        modelDonor.Weight= Convert.ToDecimal(drBloodBank["Weight"]);
                        modelDonor.BirthDate= Convert.ToDateTime(drBloodBank["BirthDate"]);
                        modelDonor.ProofType= Convert.ToString(drBloodBank["ProofType"]);
                        modelDonor.ProofNumber = Convert.ToString(drBloodBank["ProofNumber"]);
                        modelDonor.Address= Convert.ToString(drBloodBank["Address"]);
                        modelDonor.Description= Convert.ToString(drBloodBank["Description"]);
                        modelDonor.Email= Convert.ToString(drBloodBank["Email"]);
                        modelDonor.ContactNumber = Convert.ToString(drBloodBank["ContactNumber"]);
                        modelDonor.Gender= Convert.ToString(drBloodBank["Gender"]);
                        ViewBag.EditImageURL = Convert.ToString(drBloodBank["Image"]);
                        modelDonor.Image = Convert.ToString(drBloodBank["Image"]);
                    }

                }
                #endregion

                #region Get City From State
                DataTable dt = dalLOC.PR_City_SelectForDropDownListByStateID(modelDonor.StateID);
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

            return View("DonorAddEdit",modelDonor);
        }
        #endregion

        [HttpPost]
        #region Add/Edit Blood Bank
        public IActionResult Save(DonorModel modelDonor)
        {
            if (modelDonor.File != null)
            {
                string FilePath = "wwwroot\\DonorImage";
                string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                string filenameWithPath = Path.Combine(path, modelDonor.File.FileName);
                modelDonor.Image = "~" + FilePath.Replace("wwwroot\\", "/") + "/" + modelDonor.File.FileName;
                using (var stream = new FileStream(filenameWithPath, FileMode.Create))
                {
                    modelDonor.File.CopyTo(stream);
                }

            }
            if (modelDonor.DonorID == null)
            {
                Donor_DAL dalDonor = new Donor_DAL();
                dalDonor.PR_Donor_InsertByUserID(modelDonor);
            }
            else
            {
                Donor_DAL dalDonor = new Donor_DAL();
                dalDonor.PR_Donor_UpdateByPKUserID(modelDonor);
            }
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

        #region Delete 
        public IActionResult Delete(int DonorID)
        {
            Donor_DAL dalDonor = new Donor_DAL();
            dalDonor.PR_Donor_DeleteByPK(DonorID);
            return RedirectToAction("Index");
        }
        #endregion
    }
}
