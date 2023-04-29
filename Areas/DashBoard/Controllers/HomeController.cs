using BloodBankProject.DAL;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using BloodBankProject.BAL;
using BloodBankProject.Areas.DashBoard.Models;
using BloodBankProject.Areas.OutPatient.Models;
using BloodBankProject.Areas.City.Models;
using BloodBankProject.Areas.BloodGroup.Models;
using BloodBankProject.Areas.State.Models;

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
            DataTable dtBloodBagsCount = dalBloodBag.PR_BloodBag_SelectInStockBloodBagsCountByBloodGroup();

            DataTable dtBloodBagsAllCount = dalBloodBag.PR_BloodBag_SelectStatusWiseBloodBagCount();
            ViewBag.ExpireBloodStockCount = dtBloodBagsAllCount.Rows[0]["Count"];
            ViewBag.InStockBloodStockCount = dtBloodBagsAllCount.Rows[1]["Count"];
            ViewBag.OutStockBloodStockCount = dtBloodBagsAllCount.Rows[2]["Count"];
            int Total = Convert.ToInt32(ViewBag.ExpireBloodStockCount) + Convert.ToInt32(ViewBag.InStockBloodStockCount) +
            Convert.ToInt32(ViewBag.OutStockBloodStockCount);
            ViewBag.TotalBloodBag = Total;
            return View("Index", dtBloodBagsCount);
        }


    }
}
