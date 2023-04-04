using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BloodBankProject.Areas.OutPatient.Models
{
    public class OutPatientModel
    {
        public string OutPatientID { get; set; }

        public string OutPatientName { get; set; }

        public int BloodGroupID { get; set; }

        public int Quantity { get; set; }

        public decimal Price { get; set; }
        public decimal TotalPrice { get; set; }

        public DateTime OutDate { get; set; }

        public int BloodCrossVerifiedBy { get; set; }

        public string DoctorCrossVerificationRemarks { get; set; }

        public string ContactNumber { get; set; }

        public string Description { get; set; }

    }

    public class GetAvailableBloodBagsAndPrice
    {
        public int BloodBagSerialNumber { get; set; }

        public decimal Price { get; set; }
    }
}
