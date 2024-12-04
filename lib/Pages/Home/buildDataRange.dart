part of 'home_page.dart';

Widget _buildDateRange() {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Column(
          children: [
             Text(
              'Date',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
             Text(
              'Aug 28,2024 - Sep 5,2024',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(width: 25,),
        
         ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('Pay now'),
            ),
      ],
    );
  }