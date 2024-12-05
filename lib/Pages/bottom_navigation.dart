import 'package:Demoz/Pages/Company/company_profile_page.dart';
import 'package:Demoz/Pages/Employee/employee_list.dart';
import 'package:Demoz/Pages/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';



class Pages extends StatelessWidget {
  const Pages({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: 0);

    List<Widget> buildScreens() {
      return [
        const HomePage(),
        const EmployeePage(),
        const CompanyProfilePage(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          // icon from image
          icon: Image.asset('assets/images/home.png', width: 30, height: 30),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset('assets/images/note.png', width: 30, height: 30),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset('assets/images/person.png', width: 30, height: 30),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarsItems(),
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
  
      navBarStyle: NavBarStyle.style3,
    );
  }
}
