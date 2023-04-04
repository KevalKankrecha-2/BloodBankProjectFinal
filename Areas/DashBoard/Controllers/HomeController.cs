﻿using BloodBankProject.DAL;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using BloodBankProject.BAL;

namespace BloodBankProject.Areas.DashBoard.Controllers
{
    [CheckAccess]
    [Area("DashBoard")]
    [Route("DashBoard/[controller]/[action]")]
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            BloodBag_DAL dalBloodBag = new BloodBag_DAL();
            DataTable dtBloodBagsCount = dalBloodBag.PR_BloodStockCountBloodBagsByBloodGroup();
            return View("Index", dtBloodBagsCount);
        }
    }
}
