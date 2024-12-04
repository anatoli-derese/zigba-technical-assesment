 part of 'home_page.dart';
 
  Widget _buildTaxInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTaxInfoItem('Income Tax', '4000 etb'),
        _buildTaxInfoItem('Pension Tax', '5000 etb'),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Tax due on',
              style: TextStyle(color: Colors.red),
            ),
            Text(
              'August',
              style: TextStyle(color: Colors.red),
            ),
           
          ],
        ),
      ],
    );
  }

  Widget _buildTaxInfoItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }