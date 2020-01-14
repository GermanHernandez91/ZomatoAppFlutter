import 'package:flutter/material.dart';
import 'package:zomato_app/screens/tabs/profile_screen.dart';
import 'package:zomato_app/screens/tabs/restaurant_list_screen.dart';
import 'package:zomato_app/screens/tabs/search_screen.dart';

class MainScreen extends StatefulWidget {
  static final String routeName = "main_screen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentTabIndex = 0;

  final List<Widget> _pages = [
    RestaurantListScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 32),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 32),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, size: 32),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
