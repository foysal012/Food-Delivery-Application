import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/categorymodel/remen_model_class.dart';
import 'package:food_delivery_app/provider/category_provider_class.dart';
import 'package:provider/provider.dart';

class FavouritePageScreen extends StatefulWidget {
   FavouritePageScreen({Key? key, this.varenda, this.remenModelClass}) : super(key: key);

  List<RemenModelClass>? varenda;

  RemenModelClass? remenModelClass;

  @override
  State<FavouritePageScreen> createState() => _FavouritePageScreenState();
}

class _FavouritePageScreenState extends State<FavouritePageScreen> {

  // final dorker = Provider.of<CategoryProviderClass>(context, listen: true);
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   dorker.getTotalPrice();
  //   super.initState();
  // }

  // aita aktu limitation
  //tik korbo in sha allah

  final remenData1 = RemenModelClass.categoryRemenList;

  @override
  Widget build(BuildContext context) {
    final categoryProviderClass = Provider.of<CategoryProviderClass>(
        context,
        listen: false
    );
    print("build");
    print("value");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Favourite"),
      ),
      body: Container(

        height: double.infinity,
        width: double.infinity,

        child: Column(
          children: [

            Expanded(
              flex: 8,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),

                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),

                      height: 300,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 3,
                          color: Colors.pink,
                        ),
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        children: [
                          Image.asset("${categoryProviderClass.allDataList[index].imgUrl}", height: 150, width: 150,),

                          SizedBox(height: 8,),

                          Text("${categoryProviderClass.allDataList[index].name}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25
                          ),
                          ),

                          SizedBox(height: 8,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.orangeAccent,),

                                  SizedBox(width: 5,),

                                  Text("${categoryProviderClass.allDataList[index].rating}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18,
                                    ),
                                  )
                                ],
                              ),

                              Row(
                                children: [
                                  Icon(Icons.location_on, color: Colors.orangeAccent,),

                                  SizedBox(width: 5,),

                                  Text("${categoryProviderClass.allDataList[index].distance}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),

                          SizedBox(
                            height: 10,
                          ),



                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Consumer<CategoryProviderClass>(
                                  builder: (context, value, child){
                                    return Text("\$${value.allDataList[index].totalAmount == null ? value.allDataList[index].price : value.allDataList[index].totalAmount}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 23,
                                      ),
                                    );
                                  }
                              ),

                              Row(
                                children: [

                                  Consumer<CategoryProviderClass>(builder: (context, value, child){
                                    return InkWell(
                                      onTap: (){
                                        //categoryProviderClass.setDecreaseItem(categoryProviderClass.allDataList[index]);
                                        value.setDecreaseItem(value.allDataList[index]);
                                      },
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.pink,
                                            width: 3,
                                          ),
                                        ),
                                        child: Icon(Icons.remove),
                                      ),
                                    );
                                  }),

                                  SizedBox(width: 10,),

                                  Consumer<CategoryProviderClass>(builder: (context, value, child){
                                    return Text("${value.allDataList[index].item}");
                                  }),

                                  SizedBox(width: 10,),

                                 Consumer<CategoryProviderClass>(
                                     builder: (context, value, child){
                                       return  InkWell(
                                         onTap: (){
                                           //categoryProviderClass.setIncreaseItem(categoryProviderClass.allDataList[index]);
                                           value.setIncreaseItem(value.allDataList[index]);
                                         },
                                         child: Container(
                                           height: 35,
                                           width: 35,
                                           decoration: BoxDecoration(
                                             shape: BoxShape.circle,
                                             color: Colors.white,
                                             border: Border.all(
                                               color: Colors.pink,
                                               width: 3,
                                             ),
                                           ),
                                           child: Icon(Icons.add),
                                         ),
                                       );
                                     },
                                 )

                                ],
                              ),

                              Consumer<CategoryProviderClass>(
                                  builder: (context, value, child){
                                    return IconButton(
                                        onPressed: (){
                                          print("Foysal");
                                          print(value.allDataList.length);

                                          value.setRemoveItemList(value.allDataList[index]);

                                          setState(() {

                                          });

                                          print(value.allDataList.length);

                                        },
                                        icon: Icon(Icons.delete, color: Colors.black,)
                                    );
                                  }
                              ),

                              // IconButton(
                              //     onPressed: (){
                              //
                              //       print("Foysal");
                              //       // value.allDataList.contains(remenData[index]) == false ?
                              //       //
                              //       // value.setAddItemList(RemenModelClass(
                              //       //     imgUrl: remenData[index].imgUrl,
                              //       //     name: remenData[index].name,
                              //       //     rating: remenData[index].rating,
                              //       //     distance: remenData[index].distance,
                              //       //     price: remenData[index].price
                              //       // )) : value.setRemoveItemList(
                              //       //     RemenModelClass(
                              //       //         imgUrl: remenData[index].imgUrl,
                              //       //         name: remenData[index].name,
                              //       //         rating: remenData[index].rating,
                              //       //         distance: remenData[index].distance,
                              //       //         price: remenData[index].price
                              //       //     )
                              //       //   // remenData[index]
                              //       //
                              //       // );
                              //       //value.allDataList.contains(widget.varenda?[index]) == true ?
                              //      // categoryProviderClass.allDataList.contains(remenData1[index]) == true ?
                              //
                              //       categoryProviderClass.setRemoveItemList(
                              //           RemenModelClass(
                              //         imgUrl: remenData1[index].imgUrl,
                              //         rating: remenData1[index].rating,
                              //         name: remenData1[index].name,
                              //         distance: remenData1[index].distance,
                              //         price:  remenData1[index].price,
                              //       )
                              //         //categoryProviderClass.allDataList[index]
                              //       );
                              //       //     :
                              //       // {
                              //       //
                              //       // };
                              //
                              //     },
                              //     icon: Icon(Icons.delete, color: Colors.black,)
                              // )

                            ],
                          )


                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, index){
                    return SizedBox(height: 10,);
                  },
                  itemCount: categoryProviderClass.allDataList.length,
              ),
            ),

            Expanded(
              flex: 2,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                  child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text("Delivery",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          ),

                          SizedBox(
                            width: 10,
                          ),

                          Text(".............................",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(
                            width: 10,
                          ),

                          Consumer<CategoryProviderClass>(
                              builder:(context, value, child){
                                return Text("\$${value.deliveryCharge}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                );
                              } )

                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text("Total Order",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(
                            width: 10,
                          ),

                          Text(".............................",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(
                            width: 10,
                          ),

                          Consumer<CategoryProviderClass>(builder: (context, value, child){
                            return Text("\$${value.subTotalPrice}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            );
                          })

                        ],
                      ),

                      InkWell(
                        onTap: (){},
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black26,

                          ),
                          child: Consumer<CategoryProviderClass>(
                            builder: (context, value, child){
                              return Center(child: Text("\$${value.deliveryCharge + value.subTotalPrice}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                              );
                            },
                          )
                        ),
                      )
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
