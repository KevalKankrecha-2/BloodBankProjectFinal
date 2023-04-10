using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace BloodBankProject.Areas.Donor.Models
{
    public class DonorModel
    {
        public int? DonorID { get; set; }


        [Required(ErrorMessage = "Please Enter Donor Name")]
        public string DonorName { get; set; }



        [Required(ErrorMessage = "Please Select State")]
        public int StateID { get; set; }



        [Required(ErrorMessage = "Please Select City")]
        public int CityID { get; set; }



        [Required(ErrorMessage = "Please Enter Donor Address")]
        [StringLength(250, ErrorMessage = "Please Enter Short Address")]
        public string Address { get; set; }




        [Required(ErrorMessage = "Please Enter Contact Number")]
        [DataType(DataType.PhoneNumber, ErrorMessage = "Please Enter Valid Mobile Number")]
        [RegularExpression(@"^([0-9]{10})$", ErrorMessage = "Please Enter Valid Mobile Number")]
        public string ContactNumber { get; set; }



        public DateTime? BirthDate { get; set; }



        [EmailAddress(ErrorMessage = "Please Enter Valid Email Addresss")]
        public string? Email { get; set; }




        public string? Gender { get; set; }




        [Required(ErrorMessage = "Please Select Prooftype")]
        public string ProofType { get; set; }


        [Required(ErrorMessage = "Please Enter Proof Number")]
        public string ProofNumber { get; set; }



        [Required(ErrorMessage = "Please Enter Pulse")]
        public string Pulse { get; set; }



        [Required(ErrorMessage = "Please Enter BP")]
        public string BP { get; set; }


        [Required(ErrorMessage = "Please Enter Wight")]
        [Range(1, int.MaxValue, ErrorMessage = "Please Enter Valid Wight")]
        public decimal Weight { get; set; }



        public IFormFile? File { get; set; }
        public string? Image { get; set; }


        [Required(ErrorMessage = "Please Select Blood Group")]
        public int BloodGroupID { get; set; }




        public string? Description { get; set; }

    }

    public class DonorDropDownModel
    {
        public int? DonorID { get; set; }

        public string DonorName { get; set; }
    }
}

