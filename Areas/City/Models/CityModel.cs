using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BloodBankProject.Areas.City.Models
{
    public class CityModel
    {

        public int? CityID { get; set; }
        public int StateID { get; set; }

        public string CityName { get; set; }

        public string CityCode { get; set; }

        public string Description { get; set; }

        public DateTime CreationDate { get; set; }

        public DateTime ModificationDate { get; set; }

    }
    public class CityDropDownModel
    {
        public int? CityID { get; set; }

        public string CityName { get; set; }

    }
}
