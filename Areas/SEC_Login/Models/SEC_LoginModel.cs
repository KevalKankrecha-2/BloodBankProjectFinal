using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BloodBankProject.Areas.SEC_Login.Models
{
    public class SEC_LoginModel
    {
        public int UserID { get; set; }

        public string UserEmailAddress { get; set; }

        public string UserName { get; set; }

        public string Password { get; set; }

    }
}
