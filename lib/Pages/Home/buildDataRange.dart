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
                backgroundColor: const Color.fromARGB(255, 240, 208, 206),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('Pay now', style: TextStyle(
                color: Colors.red
              ),),
            ),
      ],
    );
  }