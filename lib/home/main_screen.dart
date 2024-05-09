import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'contacts_screen.dart';
import 'delivery_screen.dart';
import 'home_screen.dart';
import 'pets_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PersistentTabController _controller =
  PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const ContactsScreen(),
      const PetsScreen(),
      const DeliveryScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: 'Главная',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white60,
        activeColorSecondary: Colors.blue.shade800,
        inactiveColorSecondary: Colors.blue.shade400,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.contacts),
        title: 'Контакты',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white60,
        activeColorSecondary: Colors.blue.shade800,
        inactiveColorSecondary: Colors.blue.shade400,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.pets),
        title: 'Питомцы',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white60,
        activeColorSecondary: Colors.blue.shade800,
        inactiveColorSecondary: Colors.blue.shade400,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.local_shipping),
        title: 'Доставка',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white60,
        activeColorSecondary: Colors.blue.shade800,
        inactiveColorSecondary: Colors.blue.shade400,
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
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          colors: [Colors.blue.shade400, Colors.blue.shade800],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 400),
      ),
      navBarStyle: NavBarStyle.style6, // Измененный стиль навигационной панели
    );
  }
}