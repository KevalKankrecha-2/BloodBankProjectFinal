




namespace BloodBankProject.Areas.State.Models
{
    public class StateModel
    {
        public int? StateID { get; set; }

        public string StateName { get; set; }

        public string StateCode { get; set; }   

        public string Description { get; set; }

        public DateTime CreationDate { get; set; }

        public DateTime ModificationDate { get; set; }
    }

    public class StateDropDownModel
    {
        public int? StateID { get; set; }

        public string StateName { get; set; }

    }
}
