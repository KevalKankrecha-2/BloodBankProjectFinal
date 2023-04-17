using BloodBankProject.DAL;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace BloodBankProject.Controllers
{
    public class HomeController : Controller
    {
        #region DashBoard
        public ActionResult Index()
        {
            return View("Index");
        }
        #endregion
    }
}
