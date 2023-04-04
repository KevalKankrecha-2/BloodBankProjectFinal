using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BloodBankProject.Areas.Donor.Models
{
    public class DonorModel
    {
        public int? DonorID { get; set; }

        public string DonorName { get; set; }

        public int StateID { get; set; }

        public int CityID { get; set; }
        public string Address { get; set; }
        public string ContactNumber { get; set; }
        public DateTime BirthDate { get; set; }
        public string Email { get; set; }
        public string Gender { get; set; }
        public string ProofType { get; set; }
        public string ProofNumber { get; set; }
        
        public string Pulse { get; set; }
        public string BP { get; set; }
        public decimal Weight { get; set; }
        public IFormFile File { get; set; }
        public string Image { get; set; }
        public int BloodGroupID { get; set; }
        public string Description { get; set; }

    }

    public class DonorDropDownModel
    {
        public int? DonorID { get; set; }

        public string DonorName { get; set; }

        

    }
}

