import 'package:demo_home_instagram/pages/home_page.dart';
import 'package:demo_home_instagram/pages/profile_user.dart';
import 'package:demo_home_instagram/pages/search_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    const Center(
      child: Text('Reels', style: TextStyle(fontSize: 30)),
    ),
    const Center(
      child: Text('Shop', style: TextStyle(fontSize: 30)),
    ),
    ProfileUser()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 35,
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 0 ? Icons.home : Icons.home_outlined),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 1 ? Icons.search : Icons.search_outlined),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 2 ? Icons.add_box : Icons.add_box_rounded),
              label: "Reels"),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 3
                  ? Icons.play_circle_fill_outlined
                  : Icons.play_circle_fill_outlined),
              label: "Shop"),
          BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 4 ? Icons.person : Icons.person_outline),
              label: "Account")
        ],
      ),
    );
  }
}
