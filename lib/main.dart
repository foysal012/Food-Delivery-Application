import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/screen/bottomnavbar/bottomnavigationbar_screen.dart';
import 'package:food_delivery_app/screen/home_page_screen.dart';
import 'package:food_delivery_app/screen/introduction/introduction_page_screen1.dart';
import 'package:food_delivery_app/screen/my_cart_page_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      //home: IntroductionPageScreen1(),
      //home: HomePageScreen(),
      home: BottomNavigationBarPageScreen(),
      //home: MyCartPageScreen(),
    );
  }
}
