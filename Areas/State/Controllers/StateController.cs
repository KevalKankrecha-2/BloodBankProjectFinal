using BloodBankProject.Areas.State.Models;
using BloodBankProject.DAL;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace BloodBankProject.Areas.State.Controllers
{
    [Area("State")]
    [Route("State/[controller]/[action]")]
    public class StateController : Controller
    {
        #region StateList
        public ActionResult Index()
        {
            LOC_DAL dalLOC = new LOC_DAL();
            DataTable dtState = dalLOC.PR_State_SelectAll();
            return View("StateList", dtState);
        }
        #endregion
       

        #region AddEdit
        public ActionResult AddEdit(int? StateID)
        {
            StateModel modelState = new StateModel();
            LOC_DAL dalLOC = new LOC_DAL();
            if (StateID != null)
            {
                DataTable dtStateByPK = dalLOC.PR_State_SelectByPK(StateID);
                if (dtStateByPK.Rows.Count == 1)
                {
                    foreach (DataRow drstate in dtStateByPK.Rows)
                    {
                        modelState.StateID = Convert.ToInt32(drstate["StateID"]);
                        modelState.StateName = Convert.ToString(drstate["StateName"]);
                        modelState.StateCode = Convert.ToString(drstate["StateCode"]);
                        modelState.Description = Convert.ToString(drstate["Description"]);
                    }
                }
            }
            return View("StateAddEdit", modelState);
        }
        #endregion

        #region Save
        [HttpPost]
        public ActionResult Save(StateModel modelState)
        {
            LOC_DAL dalLOC = new LOC_DAL();
            if (modelState.StateID == null)
            {
                if (modelState.StateName.Trim() != null && modelState.StateCode.Trim() != null)
                {
                    dalLOC.PR_State_InsertByUserID(modelState);
                }
            }
            else
            {
                if (modelState.StateName.Trim() != null && modelState.StateCode.Trim() != null)
                {
                    dalLOC.PR_State_UpdateByPKUserID(modelState);
                }

            }


            return RedirectToAction("Index");
        }
        #endregion

        #region Delete
        public IActionResult Delete(int StateID)
        {
            LOC_DAL dalLoc = new LOC_DAL();
            dalLoc.PR_State_DeleteByPK(StateID);
            return RedirectToAction("Index");
        }
        #endregion
    }
}
