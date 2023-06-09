﻿
using System.ComponentModel.DataAnnotations;

namespace BloodBankProject.Areas.City.Models
{
    public class CityModel
    {
        public int? CityID { get; set; }

        [Required(ErrorMessage = "Please Select State")]
        public int StateID { get; set; }

        [Required(ErrorMessage = "Please Enter City Name")]
        public string CityName { get; set; }

        public string? CityCode { get; set; }

        public string? Description { get; set; }

        public DateTime CreationDate { get; set; }

        public DateTime ModificationDate { get; set; }

    }
    public class CityDropDownModel
    {
        public int? CityID { get; set; }

        public string CityName { get; set; }

    }
}
