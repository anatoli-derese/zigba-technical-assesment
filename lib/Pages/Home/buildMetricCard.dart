  part of 'home_page.dart';
  Widget _buildMetricCards() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildMetricCard('Number of Employees', '20', Colors.blue),
        _buildMetricCard('Income Tax paid', '2000', Colors.green),
        _buildMetricCard('Pension Tax Paid', '4', Colors.blue),
        _buildMetricCard('Employees Performance', '95 %', Colors.red),
      ],
    );
  }

  Widget _buildMetricCard(String title, String value, Color color) {
  return Container(
    decoration: BoxDecoration(
      color: color.withOpacity(0.04),
      border: Border.all(color: color, width: 2), // Add border color and width
      borderRadius: BorderRadius.circular(45), // Match the Card's border radius
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    ),
  );
}
