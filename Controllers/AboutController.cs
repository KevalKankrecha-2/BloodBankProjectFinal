using BloodBankProject.DAL;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace BloodBankProject.Controllers
{
    public class AboutController : Controller
    {
        public IActionResult Index()
        {
            BloodBank_DAL dalBloodBank = new BloodBank_DAL();
            DataTable dtBloodBank = dalBloodBank.PR_BloodBank_SelectAll();
            return View("About", dtBloodBank);
        }
    }
}
