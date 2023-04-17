namespace BloodBankProject.Areas.DashBoard.Models
{
    public class PieChart
    {

        public List<String> BloodGroupName { get; set; }

        public List<Int32> BloodBagsCount { get; set; }

    }

    public class AreaChartModel
    {
        public string Status { get; set; }

        public int Count { get; set; }
    }
}
