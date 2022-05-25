import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marmara_ziraat/Pages/contact_us.dart';
import 'package:marmara_ziraat/Pages/home/main_products_page.dart';
import 'package:marmara_ziraat/utils/Colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../about_us.dart';
import '../search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late PersistentTabController _controller;


  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);

    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      const MainProductPage(),
      //SearchBar(),
      AboutUS(),
      const ContactUs(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Ana sayfa"),
        activeColorPrimary: AppColor.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    /*  PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: ("Arama"),
        activeColorPrimary: AppColor.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),*/
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.map),
        title: ("İletişim"),
        activeColorPrimary: AppColor.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.business_sharp),
        title: ("Hakkımızda"),
        activeColorPrimary: AppColor.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        onTap: onTapNav,
        items: const[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: "Ans sayfa"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Arama"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_sharp),
            label: "Hakkımızda"
          )
        ],
      ),
    );
  }*/
}
