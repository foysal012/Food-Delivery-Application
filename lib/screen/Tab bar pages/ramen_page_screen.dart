import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/categorymodel/remen_model_class.dart';

class RamenPageScreen extends StatefulWidget {
  const RamenPageScreen({Key? key}) : super(key: key);

  @override
  State<RamenPageScreen> createState() => _RamenPageScreenState();
}

class _RamenPageScreenState extends State<RamenPageScreen> {

  var remenData = RemenModelClass.categoryRemenList;

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
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(25),

                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: Image(image: AssetImage("${remenData[index].imgUrl}"), height: 170,width: 170,)),

                            SizedBox(height: 15,),

                            Center(child: Text("${remenData[index].name}")),

                            SizedBox(height: 10,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.orange,),
                                    Text("${remenData[index].rating}"),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Icon(Icons.location_on, color: Colors.pinkAccent,),
                                    Text("${remenData[index].distance}"),
                                  ],
                                )

                              ],
                            ),

                            SizedBox(height: 10,),

                            Text("${remenData[index].price}")
                          ],
                        ),
                      ),

                      Positioned(
                        bottom:0,
                        right:0,
                          child: Container(
                              height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: Colors.black,
                            ),
                            child: Icon(Icons.shopping_cart_outlined, color: Colors.white,),
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
                  itemCount: remenData.length,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
