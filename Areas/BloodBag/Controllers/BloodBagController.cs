using BloodBankProject.Areas.BloodBag.Models;
using BloodBankProject.Areas.BloodGroup.Models;
using BloodBankProject.Areas.Doctor.Models;
using BloodBankProject.Areas.Donor.Models;
using BloodBankProject.DAL;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data;

namespace BloodBankProject.Areas.BloodBag.Controllers
{
    [Area("BloodBag")]
    [Route("BloodBag/[controller]/[action]")]
    public class BloodBagController : Controller
    {

        public IActionResult Index()
        {
            BloodBag_DAL dalBloodBag = new BloodBag_DAL();
            DataTable dtBloodBag = dalBloodBag.PR_BloodStock_SelectAll();
            return View("BloodBagList", dtBloodBag);
        }

        #region Open Form For Add/Edit
        [HttpPost]
        public IActionResult Add(int? BloodBagSerialNumber)
        {
            Donor_DAL dalDonor = new Donor_DAL();
            Doctor_DAL dalDoctor = new Doctor_DAL();
            BloodGroup_DAL dalBloodGroup = new BloodGroup_DAL();
            BloodBag_DAL dalBloodBag = new BloodBag_DAL();
            BloodBagModel modelBloodBag = new BloodBagModel();

            #region Here Donor Drop Down are Passed For Add/Edit Mode
            DataTable dtDonorDropDownList = dalDonor.PR_Donor_SelectForDropDownList();
            List<DonorDropDownModel> donorDropDownList = new List<DonorDropDownModel>();
            if (dtDonorDropDownList.Rows.Count > 0)
            {
                foreach (DataRow drDonorDropDown in dtDonorDropDownList.Rows)
                {
                    DonorDropDownModel DonorDropDown = new DonorDropDownModel();
                    if ((int)drDonorDropDown["DonorID"] != 0)
                    {
                        DonorDropDown.DonorID = (int)drDonorDropDown["DonorID"];
                    }
                    if ((string)drDonorDropDown["DonorName"].ToString().Trim() != null)
                    {
                        DonorDropDown.DonorName = (string)drDonorDropDown["DonorName"].ToString().Trim();
                    }
                    donorDropDownList.Add(DonorDropDown);
                }
                ViewBag.DonorDropDownList = donorDropDownList;
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


            if (BloodBagSerialNumber != null)
            {
                DataTable dtBloodStockByPK = dalBloodBag.PR_BloodStock_SelectByPK(BloodBagSerialNumber);
                #region Select By PK

                if (dtBloodStockByPK.Rows.Count == 1)
                {
                    foreach (DataRow drBlooStockByPK in dtBloodStockByPK.Rows)
                    {
                        modelBloodBag.BloodBagSerialNumber = Convert.ToInt32(drBlooStockByPK["BloodBagSerialNumber"]);
                        modelBloodBag.DonorID = Convert.ToInt32(drBlooStockByPK["DonorID"]);
                        modelBloodBag.BloodGroupID = Convert.ToInt32(drBlooStockByPK["BloodGroupID"]);
                        modelBloodBag.DonateDate = Convert.ToDateTime(drBlooStockByPK["DonateDate"]);
                        modelBloodBag.ExpireDate = Convert.ToDateTime(drBlooStockByPK["ExpireDate"]);
                        modelBloodBag.VerifiedDoctorID = Convert.ToInt32(drBlooStockByPK["VerifiedDoctorID"]);
                        modelBloodBag.VerificationDoctorRemarks = Convert.ToString(drBlooStockByPK["VerificationDoctorRemarks"]);
                        modelBloodBag.Description = Convert.ToString(drBlooStockByPK["Description"]);

                    }
                }
                #endregion
            }
            return View("BloodBagsAddEdit", modelBloodBag);
        }
        #endregion

        #region Save Blood Baag Stock
        [HttpPost]
        public IActionResult Save(BloodBagModel modelBloodBag)
        {
            BloodBag_DAL dalBloodBag = new BloodBag_DAL();
            if (modelBloodBag.BloodBagSerialNumber != null)
            {
                /*dalBloodBag.PR_BloodStock_UpdateByPKUserID(modelBloodBag);*/
            }
            else
            {
                /*dalBloodBag.PR_BloodStock_InsertByUserID(modelBloodBag);*/
            }
            
            return RedirectToAction("Index");
        }
        #endregion

        #region Delete
        public IActionResult Delete(int BloodBagSerialNumber)
        {
            BloodBag_DAL dalBloodBag = new BloodBag_DAL();
            dalBloodBag.PR_BloodStock_DeleteByPK(BloodBagSerialNumber);
            return RedirectToAction("Index");
        }
        #endregion

    }
}
