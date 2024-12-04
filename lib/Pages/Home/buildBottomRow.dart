
 part of 'home_page.dart';

Widget _buildEmployeeComposition() {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(12.0), // Reduced padding
      child: Column(
        children: [
          const Text(
            'Employee Composition',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), // Reduced font size
          ),
          const SizedBox(height: 12), 
          SizedBox(
            height: 80, 
            width: 80,  
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: 70, 
                    width: 70,  
                    child: CircularProgressIndicator(
                      value: 0.65,
                      strokeWidth: 8, 
                      backgroundColor: Colors.purple.withOpacity(0.2),
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    '858\nEmployees',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12), 
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12), 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem(Colors.purple, '35%'),
              const SizedBox(width: 12), 
              _buildLegendItem(Colors.teal, '65%'),
            ],
          ),
        ],
      ),
    ),
  );
}

  Widget _buildLegendItem(Color color, String percentage) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(percentage),
      ],
    );
  }
  Widget _buildTaxSummary() {
  return const Card(
    child: Padding(
      padding: EdgeInsets.all(8.0), // Reduced padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tax summary',
            style: TextStyle(fontSize: 12, color: Colors.grey), // Smaller text
          ),
          SizedBox(height: 4), 
          Text(
            '9,349.85 etb',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Smaller font
          ),
          SizedBox(height: 4),
          Text(
            '49.98% ↑',
            style: TextStyle(color: Colors.green, fontSize: 12), // Smaller text
          ),
        ],
      ),
    ),
  );
}