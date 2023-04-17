using BloodBankProject.DAL;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using BloodBankProject.BAL;
using BloodBankProject.Areas.DashBoard.Models;
using BloodBankProject.Areas.OutPatient.Models;
using BloodBankProject.Areas.City.Models;
using BloodBankProject.Areas.BloodGroup.Models;

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
            PieChart modelpiechart = new PieChart();
            DataTable dtBloodBagsCount = dalBloodBag.PR_BloodBag_SelectInStockBloodBagsCountByBloodGroup();
            /*foreach (DataRow dr in dtBloodBagsCount.Rows)
            {
                string demo = "demo";
                modelpiechart.BloodGroupName.Add(demo.ToString());
                *//*modelpiechart.BloodBagsCount.Add((int)1);*//*
            }*/
            return View("Index", dtBloodBagsCount);
        }

        [HttpPost]
        public IActionResult PR_BloodBag_SelectInStockExpiredOutedBloodBagsByMonthAreaChart()
        {
            BloodBag_DAL dalBloodBag = new BloodBag_DAL();
            DataTable dtBloodBagsCount = dalBloodBag.PR_BloodBag_SelectInStockExpiredOutedBloodBagsByMonthAreaChart();

            List<AreaChartModel> AreaChartStatusCountList = new List<AreaChartModel>();
            foreach (DataRow dr in dtBloodBagsCount.Rows)
            {
                AreaChartModel dropdown = new AreaChartModel();
                dropdown.Status = Convert.ToString(dr["Status"]);
                dropdown.Count = Convert.ToInt32(dr["BloodBags"]);
                AreaChartStatusCountList.Add(dropdown);
            }
            var vmodel = AreaChartStatusCountList;
            return Json(vmodel);
        }

    }
}
