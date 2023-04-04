using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BloodBankProject.Areas.Doctor.Models
{
    public class DoctorModel
    {
        public int? DoctorID { get; set; }

        public string DoctorName { get; set; }

        public int StateID { get; set; }

        public int CityID { get; set; }
        public string Address { get; set; }
        public string ContactNumber { get; set; }
        public DateTime BirthDate { get; set; }
        public string Email { get; set; }
        public string Gender { get; set; }
        public string Description { get; set; }

    }

    public class DoctorDropDownModel
    {
        public int? DoctorID { get; set; }

        public string DoctorName { get; set; }

       

    }
}

