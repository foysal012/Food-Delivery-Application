import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/screen/bottomnavbar/bottomnavigationbar_screen.dart';
import 'package:food_delivery_app/screen/introduction/introduction_page_screen2.dart';

class IntroductionPageScreen1 extends StatefulWidget {
  const IntroductionPageScreen1({Key? key}) : super(key: key);

  @override
  State<IntroductionPageScreen1> createState() => _IntroductionPageScreen1State();
}

class _IntroductionPageScreen1State extends State<IntroductionPageScreen1> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => IntroDuctionPageScreen2()));
    });
    super.initState();
  }

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

            const  SizedBox(
              height: 30,
            ),

            Container(

              height: 350,
              width: 350,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("images/w1.png"))),
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

            const  SizedBox(
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
                      color: Colors.white),
                ),

                const  SizedBox(
                  width: 10,
                ),

                Container(
                  height: 5,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white54),
                ),

                const  SizedBox(
                  width: 10,
                ),

                Container(
                  height: 5,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white54),
                ),
              ],
            ),

            Spacer(),

            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomNavigationBarPageScreen()));
              },
              child: Container(
                height: 70,
              width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text("Get Started",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
