import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/categorymodel/remen_model_class.dart';
import 'package:food_delivery_app/provider/category_provider_class.dart';
import 'package:provider/provider.dart';

class RamenPageScreen extends StatefulWidget {
  const RamenPageScreen({Key? key}) : super(key: key);

   //static int selectedItemData = selectedItem;

  @override
  State<RamenPageScreen> createState() => _RamenPageScreenState();
}

class _RamenPageScreenState extends State<RamenPageScreen> {

  var remenData = RemenModelClass.categoryRemenList;

 static int selectedItem = 0;

 // List<RemenModelClass> addItem = [];

  @override
  Widget build(BuildContext context) {
    final categoryProviderClass = Provider.of<CategoryProviderClass>(context);
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
                            Center(child: Image(image: AssetImage("${remenData[index].imgUrl}"), height: 170,width: 170,)),

                            SizedBox(height: 8,),

                            Center(child: Text("${remenData[index].name}",
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

                                    Text("${remenData[index].rating}",
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

                                    Text("${remenData[index].distance}",
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

                            Text("${remenData[index].price}",
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
                          child: Consumer<CategoryProviderClass>(builder: (context, value, child){
                            return InkWell(
                              onTap:(){
                                // setState(() {
                                //   // selectedItem++;
                                //   // print(selectedItem);
                                //   // value.setItemList(index);
                                //   // print("${value.allDataList}");
                                //
                                //   if(addItem.contains(remenData[index])) {
                                //     addItem.remove(
                                //         RemenModelClass(
                                //             name: remenData[index].name,
                                //             price: remenData[index].price,
                                //             imgUrl: remenData[index].imgUrl,
                                //             distance: remenData[index].distance,
                                //             rating: remenData[index].rating
                                //         )
                                //     );
                                //   } else {
                                //     addItem.add(RemenModelClass(
                                //         name: remenData[index].name,
                                //         price: remenData[index].price,
                                //         imgUrl: remenData[index].imgUrl,
                                //         distance: remenData[index].distance,
                                //         rating: remenData[index].rating
                                //     ));
                                //   }
                                //   // addItem.add(RemenModelClass(
                                //   //   name: remenData[index].name,
                                //   //   price: remenData[index].price,
                                //   //   imgUrl: remenData[index].imgUrl,
                                //   //   distance: remenData[index].distance,
                                //   //   rating: remenData[index].rating
                                //   // ));
                                //
                                //   print("${addItem.length}");
                                //   print("${addItem.toString()}");
                                //
                                // });

                                value.allDataList.contains(remenData[index]) == false ?

                                  value.setAddItemList(RemenModelClass(
                                      imgUrl: remenData[index].imgUrl,
                                      name: remenData[index].name,
                                      rating: remenData[index].rating,
                                      distance: remenData[index].distance,
                                      price: remenData[index].price
                                  )) :
                                {

                                }
                                 ;

                                print(value.allDataList.length);
                                print(value.allDataList.toList());
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
                            );
                          },)
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
                  //itemCount: categoryProviderClass.allDataList.length,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
 //int selectedItem = 0;
List<RemenModelClass> addItem = [];
