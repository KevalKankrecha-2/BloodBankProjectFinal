using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using System.Threading.Tasks;

namespace BloodBankProject.Areas.BloodBag.Models
{
    public class BloodBagModel
    {
        public int? BloodBagSerialNumber { get; set; }


        [Required(ErrorMessage = "Please Select BloodGroup")]
        public int BloodGroupID { get; set; }



        [Required(ErrorMessage = "Please Select Donor")]
        public int DonorID { get; set; }



        public DateTime DonateDate { get; set; } = DateTime.Now;



        [Required(ErrorMessage = "Please Select Expire Date")]
        public DateTime ExpireDate { get; set; } = DateTime.Now;



        [Required(ErrorMessage = "Please Select Doctor")]
        public int VerifiedDoctorID { get; set; }



        public string? VerificationDoctorRemarks { get; set; }

        public string? Status { get; set; }

        public int? OutPatientID { get; set; }

        public string? Description { get; set; }
    }
}
