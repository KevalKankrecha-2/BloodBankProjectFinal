using BloodBankProject.DAL;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace BloodBankProject.Areas.State.Controllers
{
    [Area("State")]
    [Route("State/[controller]/[action]")]
    public class StateController : Controller
    {
        public IActionResult Index()
        {
            LOC_DAL dalLOC = new LOC_DAL();
            DataTable dtState = dalLOC.PR_State_SelectAll();
            return View("StateList",dtState);
        }
    }
}
