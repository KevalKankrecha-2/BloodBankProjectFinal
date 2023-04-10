using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace BloodBankProject.Areas.BloodGroup.Models
{
    public class BloodGroupModel
    {
        public int? BloodGroupID { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Please Enter Valid Price")]
        public decimal Price { get; set; }

        [Required(ErrorMessage = "Please Enter Blood Group Name")]
        public string BloodGroupName { get; set; }

        public string? Description { get; set; }
    }

    public class BloodGroupDropDownModel
    {
        public int? BloodGroupID { get; set; }

        public string BloodGroupName { get; set; }

    }
}
