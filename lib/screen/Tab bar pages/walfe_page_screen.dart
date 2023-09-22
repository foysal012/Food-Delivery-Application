import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/categorymodel/walfe_model_class.dart';

class WalfePageScreen extends StatefulWidget {
  const WalfePageScreen({Key? key}) : super(key: key);

  @override
  State<WalfePageScreen> createState() => _WalfePageScreenState();
}

class _WalfePageScreenState extends State<WalfePageScreen> {

  var walfeData = WalfeModelClass.categoryWalfeList;

  static int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: Column(
          children: [

            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(
                            top: 5,
                            left: 5,
                            right: 5
                        ),
                        //height: 80,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(25),

                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: Image(image: AssetImage("${walfeData[index].imgUrl}"), height: 170,width: 170,)),

                            SizedBox(height: 8,),

                            Center(child: Text("${walfeData[index].name}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20
                              ),
                            ),),

                            SizedBox(height: 10,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.orange,),

                                    SizedBox(width: 2,),

                                    Text("${walfeData[index].rating}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black38,
                                          fontSize: 20
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Icon(Icons.location_on, color: Colors.pinkAccent,),

                                    SizedBox(width: 2,),

                                    Text("${walfeData[index].distance}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black38,
                                          fontSize: 20
                                      ),
                                    ),
                                  ],
                                )

                              ],
                            ),

                            SizedBox(height: 10,),

                            Text("${walfeData[index].price}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 22
                              ),
                            )
                          ],
                        ),
                      ),

                      Positioned(
                        bottom:0,
                        right:0,
                        child: InkWell(
                          onTap:(){
                            setState(() {
                              selectedItem++;
                              print(selectedItem);
                            });
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: Colors.black,
                            ),
                            child: Icon(Icons.shopping_cart_outlined, color: Colors.white,),
                          ),
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (_,index){
                  return SizedBox(
                    width: 10,
                  );
                },
                itemCount: walfeData.length,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
