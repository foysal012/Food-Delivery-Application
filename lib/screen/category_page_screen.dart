import 'package:flutter/material.dart';
import 'package:food_delivery_app/screen/Tab%20bar%20pages/burger_page_screen.dart';
import 'package:food_delivery_app/screen/Tab%20bar%20pages/ramen_page_screen.dart';
import 'package:food_delivery_app/screen/Tab%20bar%20pages/salad_page_screen.dart';
import 'package:food_delivery_app/screen/Tab%20bar%20pages/walfe_page_screen.dart';

class CategoryPageScreen extends StatefulWidget {
  const CategoryPageScreen({Key? key}) : super(key: key);

  @override
  State<CategoryPageScreen> createState() => _CategoryPageScreenState();
}

class _CategoryPageScreenState extends State<CategoryPageScreen> with SingleTickerProviderStateMixin{

  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(
        length: 8,
        vsync: this
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(

          padding: EdgeInsets.only(

            top: 20,
            left: 10,
            right: 10,
            bottom: 10
          ),

          height: double.infinity,
          width: double.infinity,

          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [

              Expanded(
                  flex: 2,
                  child: Container(
                    child: TabBar(
                      controller: tabController,
                        isScrollable: true,
                        labelColor: Colors.orange,
                        indicatorColor: Colors.orange,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 3,
                            color: Colors.orangeAccent
                          ),
                        ),
                        onTap: (value){
                        print("The index number is $value");
                        },

                        tabs: [
                          Container(
                            child: Column(
                              children: [

                                Image.asset("images/ramen.png", height: 100,width: 100,),

                                SizedBox(height: 5,),

                                Text("Remen"),
                              ],
                            ),
                          ),

                          Container(
                            child: Column(
                              children: [

                                Image.asset("images/berger.png", height: 100,width: 100,),

                                SizedBox(height: 5,),

                                Text("Burger"),
                              ],
                            ),
                          ),

                          Container(
                            child: Column(
                              children: [

                                Image.asset("images/salad.png", height: 100,width: 100,),

                                SizedBox(height: 5,),

                                Text("Salad"),
                              ],
                            ),
                          ),

                          Container(
                            child: Column(
                              children: [

                                Image.asset("images/waffie.png", height: 100,width: 100,),

                                SizedBox(height: 5,),

                                Text("Waffie"),
                              ],
                            ),
                          ),

                          Container(
                            child: Column(
                              children: [

                                Image.asset("images/waffie.png", height: 100,width: 100,),

                                SizedBox(height: 5,),

                                Text("Waffie"),
                              ],
                            ),
                          ),

                          Container(
                            child: Column(
                              children: [

                                Image.asset("images/salad.png", height: 100,width: 100,),

                                SizedBox(height: 5,),

                                Text("Salad"),
                              ],
                            ),
                          ),

                          Container(
                            child: Column(
                              children: [

                                Image.asset("images/berger.png", height: 100,width: 100,),

                                SizedBox(height: 5,),

                                Text("Burger"),
                              ],
                            ),
                          ),

                          Container(
                            child: Column(
                              children: [

                                Image.asset("images/ramen.png", height: 100,width: 100,),

                                SizedBox(height: 5,),

                                Text("Remen"),
                              ],
                            ),
                          ),

                        ]
                    ),
                  ),
              ),

              SizedBox(
                height: 20,
              ),

              Expanded(
                  flex: 4,
                  child: TabBarView(
                      controller: tabController,
                      children: [
                        RamenPageScreen(),
                        BurgerPageScreen(),
                        SaladPageScreen(),
                        WalfePageScreen(),
                        WalfePageScreen(),
                        SaladPageScreen(),
                        BurgerPageScreen(),
                        RamenPageScreen(),
                      ]
                  )
              )
            ],
          ),
        ),
    );
  }
}
