import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screen/authentication/signin_page_screen.dart';
import 'package:food_delivery_app/screen/home_page_screen.dart';
import 'package:food_delivery_app/screen/introduction/introduction_page_screen1.dart';
import 'package:food_delivery_app/screen/introduction/introduction_page_screen2.dart';
import 'package:food_delivery_app/screen/introduction/introduction_page_screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionPageScreen extends StatefulWidget {
  const IntroductionPageScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionPageScreen> createState() => _IntroductionPageScreenState();
}

class _IntroductionPageScreenState extends State<IntroductionPageScreen> {

  PageController _controller = PageController();


  void onLogin() {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user =  _auth.currentUser;

    if(user?.uid == null){
      //Timer(Duration(milliseconds: 100), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInPageScreen()));

        print("Foysal");
     // });
    } else {
      //Timer(Duration(milliseconds: 100), () {
      print("Joarder");
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePageScreen()));
      // });
    }
    // setState(() {
    //
    // });

  }

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index){
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
                  IntroductionPageScreen1(),
                  IntroDuctionPageScreen2(),
                  IntroductionPageScreen3(),
            ],
          ),

          Container(
              alignment: Alignment(0, 0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  InkWell(
                      onTap:(){
                        _controller.jumpToPage(2);
                      },
                      child: Text("Skip")
                  ),

                  SmoothPageIndicator(controller: _controller, count: 3),

                  onLastPage == true ?
                      InkWell(
                          onTap: (){
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn
                            );

                            //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignInPageScreen()));
                            onLogin();
                            print("Hello");
                          },
                          child: Text("Done")
                      )
            :
        InkWell(
        onTap: (){
      _controller.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn
      );
    },
    child: Text("Next")
    ),
                ],
              )),
        ],
      )
    );
  }
}

