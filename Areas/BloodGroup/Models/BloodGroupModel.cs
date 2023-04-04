using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BloodBankProject.Areas.BloodGroup.Models
{
    public class BloodGroupModel
    {
      public int?  BloodGroupID { get; set; }

       public decimal Price { get; set; }
      public string BloodGroupName { get; set; }

      public string? Description { get; set; }
    }

    public class BloodGroupDropDownModel
    {
        public int? BloodGroupID { get; set; }

        public string BloodGroupName { get; set; }
        
    }
}
