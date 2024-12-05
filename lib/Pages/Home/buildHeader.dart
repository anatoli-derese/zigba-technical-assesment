  part of 'home_page.dart';
  
Widget _buildHeader(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Home',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () {
          
        },
      ),
    ],
  );
}
