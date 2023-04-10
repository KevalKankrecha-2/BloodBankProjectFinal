using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using System.Threading.Tasks;

namespace BloodBankProject.Areas.OutPatient.Models
{
    public class OutPatientModel
    {
        public string OutPatientID { get; set; }

        [Required(ErrorMessage = "Please Enter Out Patient Name")]
        public string OutPatientName { get; set; }


        [Required(ErrorMessage = "Please Select BlodGroup")]
        public int BloodGroupID { get; set; }


        [Range(1, int.MaxValue, ErrorMessage = "Please Enter Valid Quantity")]
        public int Quantity { get; set; }


        [Range(1, int.MaxValue, ErrorMessage = "Please Enter Valid Price")]
        public decimal Price { get; set; }



        public decimal TotalPrice { get; set; }
    


        public DateTime OutDate { get; set; }= DateTime.Now;



        [Required(ErrorMessage = "Please Select Doctor")]
        public int BloodCrossVerifiedBy { get; set; }




        public string? DoctorCrossVerificationRemarks { get; set; }


        [DataType(DataType.PhoneNumber, ErrorMessage = "Please Enter Valid Mobile Number")]
        [RegularExpression(@"^([0-9]{10})$", ErrorMessage = "Please Enter Valid Mobile Number")]
        public string? ContactNumber { get; set; }



        public string? Description { get; set; }

        public List<Int32>OutBloodBags { get; set; }

    }

    public class GetAvailableBloodBagsAndPrice
    {
        public int BloodBagSerialNumber { get; set; }

        public decimal Price { get; set; }
    }

}
