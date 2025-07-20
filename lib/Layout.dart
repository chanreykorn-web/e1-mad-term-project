import 'package:flutter/material.dart';
import 'package:flutter_application_1/ScreenWelcome.dart';
import 'package:iconsax/iconsax.dart';

class Layout extends StatefulWidget {
  final String? username;
  const Layout({super.key, this.username});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      ScreenWelcome(username: widget.username!),
      Center(child: Text('Search', style: TextStyle(fontSize: 24))),
      Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
    ];

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xFFfd8044),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Iconsax.home_1), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.search_normal),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.setting_2),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
