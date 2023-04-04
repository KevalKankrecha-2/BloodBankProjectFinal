using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BloodBankProject.Areas.BloodBag.Models
{
    public class BloodBagModel
    {

        public int? BloodBagSerialNumber { get; set; }

        public int BloodGroupID { get; set; }

        public int DonorID { get; set; }

        public DateTime DonateDate { get; set; }

        public DateTime ExpireDate { get; set; }


        public int VerifiedDoctorID { get; set; }

        public string VerificationDoctorRemarks { get; set; }

        public string Status { get; set; }

        public int OutPatientID { get; set; }

        public string Description { get; set; }
    }
}
