using BloodBankProject.Areas.SEC_Login.Models;
using BloodBankProject.DAL;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace BloodBankProject.Areas.SEC_Login.Controllers
{
    [Area("SEC_Login")]
    [Route("SEC_Login/[controller]/[action]")]
    public class SEC_LoginController : Controller
    {
        public IActionResult Index()
        {
            return View("Login");
        }

        [HttpPost]
        public IActionResult LoginValidate(SEC_LoginModel modelSEC_Login)
        {
            DataTable dt;
            string error = null;
            if (modelSEC_Login.UserName == null)
            {
                error += "User Name is required";
            }
            if (modelSEC_Login.Password == null)
            {
                error += "<br/>Password is required";
            }

            if (error != null)
            {
                TempData["Error"] = error;
                return RedirectToAction("Index");
            }
            else
            {
                SEC_DAL dalSEC = new SEC_DAL();
                dt = dalSEC.PR_User_SelectByUserNamePassword(modelSEC_Login.UserName, modelSEC_Login.Password);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        HttpContext.Session.SetString("UserName", dr["UserName"].ToString());
                        HttpContext.Session.SetString("UserID", dr["UserID"].ToString());
                        HttpContext.Session.SetString("Password", dr["Password"].ToString());
                        break;
                    }
                }
                else
                {
                    TempData["LoginError"] = "User Name or Password is invalid!";
                    return View("Login");
                }
            }
            if (HttpContext.Session.GetString("UserName") != null && HttpContext.Session.GetString("Password") != null)
            {
                return RedirectToAction("Index", "Home", new { area = "DashBoard" });
            }
            return View("Login");
        }


        public IActionResult LogOut()
        {
            HttpContext.Session.Clear();
            return View("Login");
        }
    }
}
