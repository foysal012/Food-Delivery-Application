import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/screen/Tab%20bar%20pages/burger_page_screen.dart';
import 'package:food_delivery_app/screen/Tab%20bar%20pages/ramen_page_screen.dart';
import 'package:food_delivery_app/screen/Tab%20bar%20pages/salad_page_screen.dart';
import 'package:food_delivery_app/screen/Tab%20bar%20pages/walfe_page_screen.dart';
import 'package:food_delivery_app/screen/category_page_screen.dart';
import 'package:food_delivery_app/screen/drawer_page_screen.dart';
import 'package:food_delivery_app/screen/my_cart_page_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> with SingleTickerProviderStateMixin{

TabController? tabController;

bool selected = false;

  var data = 0;

  GlobalKey<ScaffoldState>  _drawerGlobalKey = GlobalKey();


@override
  void initState() {
    // TODO: implement initState
  tabController = TabController(
    vsync: this,
    length: 4,
  );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerGlobalKey,
      drawer: MyDrawer(),
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
                        image: AssetImage("images/w4.png"),
                        fit: BoxFit.cover
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          IconButton(onPressed: (){
                            _drawerGlobalKey.currentState!.openDrawer();
                          }, icon: Icon(Icons.menu)),
                          
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

                              InkWell(
                                onTap:(){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyCartPageScreen()));
                                },
                                child: Stack(

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
                                            child: Text("${data}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            ),
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),

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
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryPageScreen()));
                            },
                            child: Text("see all",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orangeAccent,
                                fontSize: 16,

                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Expanded(
                          flex: 2,
                          child: TabBar(
                            controller: tabController,
                            labelColor: Colors.orange,
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(08),
                              ),
                              border: Border.all(
                                width: 3,
                                color: Colors.orangeAccent,
                              ),
                            ),
                            isScrollable: true,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3,
                            ),
                            onTap: (val){
                              print("Index is $val");
                            },
                            tabs: [
                              Container(
                                  child: Column(
                                    children: [
                                      Image(image: AssetImage("images/ramen.png"),height: 50, width: 50,),
                                      SizedBox(height: 5,),
                                      Text("Remen"),
                                    ],
                                  )),
                              Container(

                                  child: Column(
                                    children: [
                                      Image(image: AssetImage("images/berger.png"),height: 50, width: 50,),
                                      Text("Burger"),
                                    ],
                                  )),
                              Container(child: Column(
                                    children: [
                                      Image(image: AssetImage("images/salad.png"),height: 50, width: 50,),
                                      Text("Salad"),
                                    ],
                                  )),
                              Container(

                                  child: Column(
                                    children: [
                                      Image(image: AssetImage("images/waffie.png"),height: 50, width: 50,),
                                      Text("Walfe"),
                                    ],
                                  )),
                            ],

                          ),
                      ),


                      //SizedBox(height: 20,),

                      Expanded(
                        flex: 8,
                        child: TabBarView(

                            controller: tabController,
                            children: [
                              RamenPageScreen(),
                              BurgerPageScreen(),
                              SaladPageScreen(),
                              WalfePageScreen(),
                            ],

                        ),
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

