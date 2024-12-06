 part of 'home_page.dart';

Widget _buildTabs({
  required bool isUpcomingSelected,
  required void Function(bool) onTabSelected,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(25),
    ),
    child: Row(
      children: [
        // Upcoming Tab
        Expanded(
          child: GestureDetector(
            onTap: () => onTabSelected(true),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: isUpcomingSelected ? Colors.blue : Colors.transparent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  'Upcoming',
                  style: TextStyle(
                    color: isUpcomingSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        // Past Tab
        Expanded(
          child: GestureDetector(
            onTap: () => onTabSelected(false),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: !isUpcomingSelected ? Colors.blue : Colors.transparent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  'Past',
                  style: TextStyle(
                    color: !isUpcomingSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


//  Widget _buildTabs() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: const Center(
//                 child: Text(
//                   'Upcoming',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               child: const Center(
//                 child: Text('Past'),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }