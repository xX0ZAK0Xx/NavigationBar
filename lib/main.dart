import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:navigation/pages/home_screen.dart';
import 'package:navigation/pages/notification_screen.dart';
import 'package:navigation/pages/profile_screen.dart';
import 'package:navigation/pages/search_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StartingPage(),
  ));
}

class StartingPage extends StatefulWidget {
  StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  List pages = [
    HomeScreen(),//0
    SearchScreen(),//1
    NotificationScreen(),//2
    ProfileScreen(),//3
  ];

  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar: Container(
        height: 70,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GNav(
            selectedIndex: selectedPage,
            onTabChange: (value) {
              // Value te thakbe button der index
              setState(() {
                selectedPage = value;
              });
            },
            backgroundColor: Colors.black,
            padding: EdgeInsets.all(15),
            activeColor: Colors.white,
            color: Colors.grey,
            gap: 5,
            tabBackgroundColor: Colors.grey.shade900,
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.search,
                text: "Search",
              ),
              GButton(
                icon: Icons.notification_add,
                text: "Notification",
              ),
              GButton(
                icon: Icons.person,
                text: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
