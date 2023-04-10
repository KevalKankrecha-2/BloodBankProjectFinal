using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace BloodBankProject.Areas.BloodBank.Models
{
    public class BloodBankModel
    {
        public int? BloodBankID { get; set; }


        [Required(ErrorMessage = "Please Enter BloodBankName")]
        public string BloodBankName { get; set; }


        [Required(ErrorMessage = "Please Select State")]
        public int StateID { get; set; }


        [Required(ErrorMessage = "Please Select City")]
        public int CityID { get; set; }


        [Required(ErrorMessage = "Please Enter Contact Number")]
        [EmailAddress(ErrorMessage = "Please Enter Valid Email Addresss")]
        public string Email { get; set; }



        [Required(ErrorMessage = "Please Enter Contact Number")]
        [DataType(DataType.PhoneNumber, ErrorMessage = "Please Enter Valid Mobile Number")]
        [RegularExpression(@"^([0-9]{10})$", ErrorMessage = "Please Enter Valid Mobile Number")]
        public string ContactNumber { get; set; }



        public string? Address { get; set; }

        public DateTime? EstablishmentDate { get; set; }



        public IFormFile? File { get; set; }


        public string? Image { get; set; }



        [Required(ErrorMessage = "Please Select Location From Map.")]
        public string Latitude { get; set; }


        [Required(ErrorMessage = "Please Select Location From Map.")]
        public string Longtitude { get; set; }



        public string? Description { get; set; }
    }
}
