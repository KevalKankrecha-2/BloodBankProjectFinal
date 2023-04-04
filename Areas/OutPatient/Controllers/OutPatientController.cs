using BloodBankProject.Areas.BloodGroup.Models;
using BloodBankProject.Areas.Doctor.Models;
using BloodBankProject.Areas.OutPatient.Models;
using BloodBankProject.DAL;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data;

namespace BloodBankProject.Areas.OutPatient.Controllers
{
    [Area("OutPatient")]
    [Route("OutPatient/[controller]/[action]")]
    public class OutPatientController : Controller
    {

        #region List of Out Patient Details
        public IActionResult Index()
        {
            OutPatient_DAL dalOutPatient = new OutPatient_DAL();
            DataTable dtOutPatient=dalOutPatient.PR_OutPatient_SelectAll();
            return View("OutPatientList", dtOutPatient);
        }
        #endregion

        #region Open Add/Edit Form
        public IActionResult Add(int? OutPatientID)
        {
            BloodGroup_DAL dalBloodGroup = new BloodGroup_DAL();
            Doctor_DAL dalDoctor = new Doctor_DAL();
            OutPatient_DAL dalOutPatient = new OutPatient_DAL();
            OutPatientModel modelOutPatient = new OutPatientModel();

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

            #region Here Doctor Drop Down are Passed For Add/Edit Mode
            DataTable dtDoctorDropDownList = dalDoctor.PR_Doctor_SelectForDropDownList();
            List<DoctorDropDownModel> DoctorDropDownList = new List<DoctorDropDownModel>();
            if (dtDoctorDropDownList.Rows.Count > 0)
            {
                foreach (DataRow drDoctorDropDown in dtDoctorDropDownList.Rows)
                {
                    DoctorDropDownModel DonorDropDown = new DoctorDropDownModel();
                    if ((int)drDoctorDropDown["DoctorID"] != 0)
                    {
                        DonorDropDown.DoctorID = (int)drDoctorDropDown["DoctorID"];
                    }
                    if ((string)drDoctorDropDown["DoctorName"].ToString().Trim() != null)
                    {
                        DonorDropDown.DoctorName = (string)drDoctorDropDown["DoctorName"].ToString().Trim();
                    }
                    DoctorDropDownList.Add(DonorDropDown);
                }
                ViewBag.DoctorDropDownList = DoctorDropDownList;
            }
            #endregion

            if (OutPatientID != null)
            {
                DataTable dtOutPatientByPK = dalOutPatient.PR_OutPatient_SelectByPK(OutPatientID);
                #region Select By PK

                if (dtOutPatientByPK.Rows.Count == 1)
                {
                    foreach (DataRow drOutPatient in dtOutPatientByPK.Rows)
                    {
                        modelOutPatient.OutPatientID = Convert.ToString(drOutPatient["OutPatientID"]);
                        modelOutPatient.OutPatientName = Convert.ToString(drOutPatient["OutPatientName"]);
                        modelOutPatient.BloodGroupID = Convert.ToInt32(drOutPatient["BloodGroupID"]);
                        modelOutPatient.Quantity = Convert.ToInt32(drOutPatient["Quantity"]);
                        modelOutPatient.TotalPrice = Convert.ToDecimal(drOutPatient["TotalPrice"]);
                        modelOutPatient.OutDate = Convert.ToDateTime(drOutPatient["OutDate"]);
                        modelOutPatient.BloodCrossVerifiedBy = Convert.ToInt32(drOutPatient["BloodCrossVerifiedBy"]);
                        modelOutPatient.DoctorCrossVerificationRemarks = Convert.ToString(drOutPatient["DoctorCrossVerificationRemarks"]);
                        modelOutPatient.Description = Convert.ToString(drOutPatient["Description"]);
                        modelOutPatient.ContactNumber = Convert.ToString(drOutPatient["ContactNumber"]);
                        modelOutPatient.Price = Convert.ToDecimal(drOutPatient["Price"]);
                    }

                }
                #endregion

            }
            return View("OutPatientAddEdit",modelOutPatient);
        }
        #endregion

        #region Save
        [HttpPost]
        public IActionResult Save(OutPatientModel modelOutPatient)
        {
            OutPatient_DAL dalOutPatient = new OutPatient_DAL();
            dalOutPatient.PR_OutPatient_InsertByUserID(modelOutPatient);
            return RedirectToAction("Index");
        }
        #endregion

        #region Delete
        public IActionResult Delete()
        {
            return RedirectToAction("Index");
        }
        #endregion

        [HttpPost]
        #region Get Price and available Blood Bags By Blood Group
        public IActionResult BloodStock_SelectInStockBloodBagsAndPriceByBloodGroup(int BloodGroupID)
        {
            OutPatient_DAL dalOutPatient = new OutPatient_DAL();
            DataTable dtBloodBagsPrice = dalOutPatient.PR_BloodStock_SelectInStockBloodBagsAndPriceByBloodGroup(BloodGroupID);
            List<GetAvailableBloodBagsAndPrice> GetAvailableBloodBagsAndPrice = new List<GetAvailableBloodBagsAndPrice>();
            foreach (DataRow dr in dtBloodBagsPrice.Rows)
            {
                GetAvailableBloodBagsAndPrice dropdown = new GetAvailableBloodBagsAndPrice();
                dropdown.BloodBagSerialNumber = Convert.ToInt32(dr["BloodBagSerialNumber"]);
                dropdown.Price = Convert.ToInt32(dr["Price"]);
                GetAvailableBloodBagsAndPrice.Add(dropdown);
            }
            var vModel = GetAvailableBloodBagsAndPrice;
            return Json(vModel);
        }
        #endregion

        #region Update Blood Bag Status
        public IActionResult BloodStockUpdateStatusByBloodBagSerialNumber(int BloodBagIdForOut,string OutPatientID)
        {
            OutPatient_DAL dalOutPatient= new OutPatient_DAL();
            dalOutPatient.PR_BloodStockUpdateStatusByBloodBagSerialNumber(BloodBagIdForOut,OutPatientID); ;
            return Json("");
        }
        #endregion





    }
}
