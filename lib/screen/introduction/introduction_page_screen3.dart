import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screen/authentication/signin_page_screen.dart';
import 'package:food_delivery_app/screen/bottomnavbar/bottomnavigationbar_screen.dart';
import 'package:food_delivery_app/screen/home_page_screen.dart';

class IntroductionPageScreen3 extends StatefulWidget {
  const IntroductionPageScreen3({Key? key}) : super(key: key);

  @override
  State<IntroductionPageScreen3> createState() => _IntroductionPageScreen3State();
}

class _IntroductionPageScreen3State extends State<IntroductionPageScreen3> {

  // void onLogin(){
  //   FirebaseAuth _auth = FirebaseAuth.instance;
  //   final user = _auth.currentUser;
  //
  //   if(user!.uid != null){
  //     Timer(Duration(milliseconds: 100), () {
  //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePageScreen()));
  //     });
  //   } else if(user.uid == null){
  //     Timer(Duration(milliseconds: 100), () {
  //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInPageScreen()));
  //     });
  //   }
  //
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   onLogin();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        height: double.infinity,
        width: double.infinity,

        padding: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
          bottom: 20,
        ),

        color: Colors.blueGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(
              height: 30,
            ),

            Container(

              height: 350,
              width: 350,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("images/w3.png"))),
            ),

            const SizedBox(
              height: 40,
            ),

            const Text(
              "Grab your\nDelicious food!",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                wordSpacing: 2,
                letterSpacing: 0.5,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            const Text(
              "Delivery food in your phone",
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                wordSpacing: 2,
                fontSize: 20,
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            Row(
              children: [
                Container(
                  height: 5,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white54),
                ),

                const SizedBox(
                  width: 10,
                ),

                Container(
                  height: 5,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white54),
                ),

                const SizedBox(
                  width: 10,
                ),

                Container(
                  height: 5,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                ),
              ],
            ),

            Spacer(),

            // InkWell(
            //   onTap: (){
            //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomNavigationBarPageScreen()));
            //   },
            //   child: Container(
            //     height: 55,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       color: Colors.orange,
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     child: const Center(
            //       child: Text("Get Started",
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: Colors.white,
            //             fontSize: 20
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
