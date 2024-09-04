import 'package:flutter/material.dart';
import 'package:movies_app/tabs/home_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121312),
      body: tabs[selectedTabIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTabIndex,
          onTap: (value) {
            selectedTabIndex = value;
            setState(() {});
          },
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Color(0xFFffb11f),
          unselectedItemColor: Color(0xFFC6C6C6),
          backgroundColor: Color(0xFF1A1A1A),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/home_icon.png")),
                label: "HOME"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/search_icon.png")),
                label: "SEARCH"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/browse_icon.png")),
                label: "Browse"),
            BottomNavigationBarItem(
                icon:
                    ImageIcon(AssetImage("assets/images/watch_list_icon.png")),
                label: "Watchlist"),
          ]),
    );
  }
  List<Widget>tabs=[
    HomeTab(),
  ];
}
