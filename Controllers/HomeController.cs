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
            Doctor_DAL dalDoctor = new Doctor_DAL();
            DataTable dtDoctor = dalDoctor.PR_Doctor_SelectAll();
            return View("Index", dtDoctor);
        }
        #endregion
    }
}
