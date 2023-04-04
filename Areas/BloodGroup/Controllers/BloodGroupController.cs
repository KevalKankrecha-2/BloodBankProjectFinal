using BloodBankProject.Areas.BloodGroup.Models;
using BloodBankProject.Areas.City.Models;
using BloodBankProject.DAL;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace BloodBankProject.Areas.BloodGroup.Controllers
{
    [Area("BloodGroup")]
    [Route("BloodGroup/[controller]/[action]")]
    public class BloodGroupController : Controller
    {
        public IActionResult Index()
        {
            BloodGroup_DAL dalBloodGroup = new BloodGroup_DAL();
            DataTable dtBloodGroup = dalBloodGroup.PR_BloodGroup_SelectAll();
            return View("BloodGroupList", dtBloodGroup);
        }


        public IActionResult Add(int? BloodGroupID)
        {
            BloodGroupModel modelBloodGroup = new BloodGroupModel();
            BloodGroup_DAL dalBloodGroup = new BloodGroup_DAL();
            if (BloodGroupID != null)
            {
                DataTable dtBloodGroupByPK = dalBloodGroup.PR_BloodGroup_SelectByPK(BloodGroupID);
                if (dtBloodGroupByPK.Rows.Count == 1)
                {
                    foreach (DataRow drBloodGroup in dtBloodGroupByPK.Rows)
                    {
                        modelBloodGroup.BloodGroupID = Convert.ToInt32(drBloodGroup["BloodGroupID"]);
                        modelBloodGroup.BloodGroupName = Convert.ToString(drBloodGroup["BloodGroupName"]);
                        modelBloodGroup.Description = Convert.ToString(drBloodGroup["Description"]);
                        modelBloodGroup.Price = Convert.ToDecimal(drBloodGroup["Price"]);
                    }
                }
            }
            return View("BloodGroupAddEdit",modelBloodGroup);
        }

        public IActionResult Save(BloodGroupModel modelBloodGroup)
        {
            BloodGroup_DAL dalBloodGroup = new BloodGroup_DAL();
            if (modelBloodGroup.BloodGroupName.ToString().Trim() != null)
            {
                if (modelBloodGroup.BloodGroupID == null)
                {
                    dalBloodGroup.PR_BloodGroup_InsertByUserID(modelBloodGroup);
                }
                else
                {
                    dalBloodGroup.PR_BloodGroup_UpdateByPKUserID(modelBloodGroup);
                }
                
            }
            return RedirectToAction("Index");
        }

        public IActionResult Delete(int BloodGroupID)
        {
            BloodGroup_DAL dalBloodGroup = new BloodGroup_DAL();
            dalBloodGroup.PR_BloodGroupDeleteByPK(BloodGroupID);
            return RedirectToAction("Index");
        }

        
    }
}
