import 'dart:io';

import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        height: double.infinity,
        width: double.infinity,

        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 20,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 40,),

            Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    right: 10,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/w4.png"),fit: BoxFit.cover)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          
                          Column(
                            children: [
                              
                              Row(
                                children: [
                                  
                                  Text("Your Location",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      wordSpacing: 2,
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                  
                                  SizedBox(width: 3,),
                                  
                                  Icon(Icons.keyboard_arrow_down_sharp, color: Colors.black87,size: 22,)
                                ],
                              ),

                              SizedBox(height: 3,),

                              Row(
                                children: [

                                  Icon(Icons.location_on, color: Colors.orange,size: 22,),

                                  SizedBox(width: 3,),

                                  Text("shibuya, Japan",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w900,
                                      wordSpacing: 2,
                                      letterSpacing: 0.2,
                                    ),
                                  ),

                                ],
                              ),

                            ],
                          ),

                          Row(
                            children: [

                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 2,
                                  ),
                                  color: Colors.white70
                                ),
                              child: Icon(Icons.search,size: 30, color: Colors.black,),
                              ),

                              SizedBox(
                                width: 10,
                              ),

                              Stack(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.black12,
                                          width: 2,
                                        ),
                                        color: Colors.white70
                                    ),
                                    child: Icon(Icons.shopping_cart_outlined,size: 30, color: Colors.black,),
                                  ),
                                  Positioned(
                                      right: -2,
                                      top: -2,
                                      child: Container(
                                        height: 18,
                                        width: 18,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.redAccent,
                                        ),
                                        child: Center(
                                          child: Text("3",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          ),
                                        ),
                                      )
                                  )
                                ],
                              )
                            ],
                          )

                        ],
                      ),

                      SizedBox(
                        height: 40,
                      ),

                      Text("Let's finds the best\nfood around you",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 2,
                        letterSpacing: 0.5,

                      ),
                      )
                    ],
                  ),
                ),
            ),

            SizedBox(height: 10,),

            Expanded(
                flex: 14,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.white12,

                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Find by Category",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                            fontSize: 20,
                          ),
                          ),
                          Text("see all",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.orangeAccent,
                              fontSize: 16,

                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}

