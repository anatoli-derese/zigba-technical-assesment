part of 'home_page.dart';



class TabsWrapper extends StatefulWidget {
  const TabsWrapper({Key? key}) : super(key: key);

  @override
  _TabsWrapperState createState() => _TabsWrapperState();
}

class _TabsWrapperState extends State<TabsWrapper> {
  bool isUpcomingSelected = true;

  void _toggleTab(bool isUpcoming) {
    setState(() {
      isUpcomingSelected = isUpcoming;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildTabs(
      isUpcomingSelected: isUpcomingSelected,
      onTabSelected: _toggleTab,
    );
  }
}
