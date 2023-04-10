using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace BloodBankProject.Areas.Doctor.Models
{
    public class DoctorModel
    {
        public int? DoctorID { get; set; }


        [Required(ErrorMessage = "Please Enter Doctor Name")]
        public string DoctorName { get; set; }



        [Required(ErrorMessage = "Please Select State")]
        public int StateID { get; set; }


        [Required(ErrorMessage = "Please Select City")]
        public int CityID { get; set; }


        public string? Address { get; set; }


        [Required(ErrorMessage = "Please Enter Contact Number")]
        [DataType(DataType.PhoneNumber, ErrorMessage = "Please Enter Valid Mobile Number")]
        [RegularExpression(@"^([0-9]{10})$", ErrorMessage = "Please Enter Valid Mobile Number")]
        public string ContactNumber { get; set; }


        public DateTime? BirthDate { get; set; }


        [EmailAddress(ErrorMessage = "Please Enter Valid Email Addresss")]
        public string? Email { get; set; }


        public string? Gender { get; set; }
        public string? Description { get; set; }

    }

    public class DoctorDropDownModel
    {
        public int? DoctorID { get; set; }

        public string DoctorName { get; set; }

       

    }
}

