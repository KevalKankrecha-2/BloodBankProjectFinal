using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BloodBankProject.Areas.BloodBank.Models
{
    public class BloodBankModel
    {
        public int? BloodBankID { get; set; }

        public string BloodBankName { get; set; }

        public int StateID { get; set; }

        public int CityID { get; set; }

        public string Email { get; set; }

        public string ContactNumber { get; set; }

        public string Address { get; set; }

        public DateTime EstablishmentDate { get; set; }

        public IFormFile File { get; set; }
        public string Image { get; set; }

        public string Latitude { get; set; }

        public string Longtitude { get; set; }

        public string Description { get; set; }



    }
}
