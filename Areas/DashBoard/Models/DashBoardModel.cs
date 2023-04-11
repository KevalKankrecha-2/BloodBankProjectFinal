namespace BloodBankProject.Areas.DashBoard.Models
{
    public class DashBoardModel
    {
            
    }
    public class BloodBagsCounts
    {
        public int InStockBloodBagCount { get; set; }

        public int OutStockBloodBagsCount { get; set; }

        public int UpComingBloodBagCount { get; set; }

        public int ExpireStockBloodBagsCount { get; set; }
    }
}
