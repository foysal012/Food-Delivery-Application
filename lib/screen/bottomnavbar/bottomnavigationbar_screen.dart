import 'package:flutter/material.dart';
import 'package:food_delivery_app/screen/category_page_screen.dart';
import 'package:food_delivery_app/screen/home_page_screen.dart';
import 'package:food_delivery_app/screen/messageing_page_screen.dart';
import 'package:food_delivery_app/screen/profile_page_screen.dart';

class BottomNavigationBarPageScreen extends StatefulWidget {
  const BottomNavigationBarPageScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarPageScreen> createState() => _BottomNavigationBarPageScreenState();
}

class _BottomNavigationBarPageScreenState extends State<BottomNavigationBarPageScreen> {

  List<Widget> pages = [
    HomePageScreen(),
    MessagingPageScreen(),
    CategoryPageScreen(),
    ProfilePageScreen(),
  ];

  int currentIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(

        onTap: (val){
          setState(() {
            currentIndex = val ;
          });
        },
        selectedLabelStyle: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 20
        ),
        selectedItemColor: Colors.black,


        unselectedFontSize: 10,
        currentIndex: currentIndex,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              backgroundColor: Color(0xff528265)
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Messaging",
              backgroundColor: Color(0xff528265)
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Category",
              backgroundColor: Color(0xff528265)
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: Color(0xff528265)
          ),
        ],

      ),

    );
  }
}
