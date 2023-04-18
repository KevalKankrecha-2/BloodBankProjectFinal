using BloodBankProject.DAL;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace BloodBankProject.Controllers
{
    public class BloodBagController : Controller
    {
        public IActionResult Index()
        {
            BloodBag_DAL dalBloodBag = new BloodBag_DAL();
            DataTable dtBloodBag = dalBloodBag.PR_BloodBag_SelectAllInStockBloodBags();
            return View("BloodBags", dtBloodBag);
        }
    }
}
