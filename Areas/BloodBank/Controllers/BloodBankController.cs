using BloodBankProject.DAL;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using BloodBankProject.Areas.State.Models;
using BloodBankProject.Areas.City.Models;
using BloodBankProject.Areas.BloodBank.Models;
using System.IO;

namespace BloodBank.Areas.BloodBank.Controllers
{
    [Area("BloodBank")]
    [Route("BloodBank/[controller]/[action]")]
    public class BloodBankController : Controller
    {
        #region View Blood Bank Details
        public IActionResult Index()
        {
            BloodBank_DAL dalBloodBank = new BloodBank_DAL();
            DataTable dtBloodBank = dalBloodBank.PR_BloodBank_SelectAll();
            return View("BloodBankDetails", dtBloodBank);
        }
        #endregion

        #region Open Add Edit Form
        public IActionResult Add(int? BloodBankID)
        {
            BloodBank_DAL dalBloodBank = new BloodBank_DAL();
            BloodBankModel modelBloodBank = new BloodBankModel();
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

            List<CityDropDownModel> CityDropDown = new List<CityDropDownModel>();
            ViewBag.CityDropDownList = CityDropDown;

            if (BloodBankID != null)
            {
                #region Select By PK
                DataTable dtBloodBank = dalBloodBank.PR_BloodBank_SelectByPK(BloodBankID);
                
                if (dtBloodBank.Rows.Count == 1)
                {
                    foreach (DataRow drBloodBank in dtBloodBank.Rows)
                    {
                        modelBloodBank.BloodBankID = Convert.ToInt32(drBloodBank["BloodBankID"]);
                        modelBloodBank.BloodBankName = Convert.ToString(drBloodBank["BloodBankName"]);
                        modelBloodBank.Address = Convert.ToString(drBloodBank["Address"]);
                        modelBloodBank.StateID = Convert.ToInt32(drBloodBank["StateID"]);
                        modelBloodBank.CityID = Convert.ToInt32(drBloodBank["CityID"]);
                        modelBloodBank.EstablishmentDate = Convert.ToDateTime(drBloodBank["EstablishmentDate"]);
                        modelBloodBank.Email = Convert.ToString(drBloodBank["Email"]);
                        modelBloodBank.ContactNumber = Convert.ToString(drBloodBank["ContactNumber"]);
                        modelBloodBank.Description = Convert.ToString(drBloodBank["Description"]);
                        modelBloodBank.Latitude = Convert.ToString(drBloodBank["Latitude"]);
                        modelBloodBank.Longtitude = Convert.ToString(drBloodBank["Longtitude"]);
                        ViewBag.EditImageURL= Convert.ToString(drBloodBank["Image"]);
                        modelBloodBank.Image= Convert.ToString(drBloodBank["Image"]);
                    }

                }
                #endregion

                #region Get City From State
                DataTable dt = dalLOC.PR_City_SelectForDropDownListByStateID(modelBloodBank.StateID);
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
            return View("BloodBankAddEdit", modelBloodBank);
        }
        #endregion

        [HttpPost]
        #region Add/Edit Blood Bank
        public IActionResult Save(BloodBankModel modelBloodBank)
        {
            if (modelBloodBank.File != null)
            {
                string FilePath = "wwwroot\\BloodBankImage";
                string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                string filenameWithPath = Path.Combine(path, modelBloodBank.File.FileName);
                modelBloodBank.Image = "~" + FilePath.Replace("wwwroot\\", "/") + "/" + modelBloodBank.File.FileName;
                using (var stream = new FileStream(filenameWithPath, FileMode.Create))
                {
                    modelBloodBank.File.CopyTo(stream);
                }

            }
            if (modelBloodBank.BloodBankID == null)
            {
                BloodBank_DAL dalBloodBank = new BloodBank_DAL();
                dalBloodBank.PR_BloodBank_InsertByUserID(modelBloodBank);
            }
            else
            {
                BloodBank_DAL dalBloodBank = new BloodBank_DAL();
                dalBloodBank.PR_BloodBank_UpdateByPKUserID(modelBloodBank);
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
    }
}

