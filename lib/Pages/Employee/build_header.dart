part of 'add_employee.dart';

Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Add New ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: 'Employee',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[500],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Here you add your new employee and start calculating his tax and salary',
          style: TextStyle(color: Colors.grey[600]),
        ),
        const SizedBox(height: 24),
      ],
    );
  }