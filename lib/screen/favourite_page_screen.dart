import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/categorymodel/remen_model_class.dart';
import 'package:food_delivery_app/provider/category_provider_class.dart';
import 'package:provider/provider.dart';

class FavouritePageScreen extends StatefulWidget {
   FavouritePageScreen({Key? key, this.varenda}) : super(key: key);

  List<RemenModelClass>? varenda;

  @override
  State<FavouritePageScreen> createState() => _FavouritePageScreenState();
}

class _FavouritePageScreenState extends State<FavouritePageScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryProviderClass = Provider.of<CategoryProviderClass>(context, listen: false);
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

        child: Expanded(
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

                          IconButton(
                              onPressed: (){

                              },
                              icon: Icon(Icons.delete, color: Colors.black,)
                          )

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
      ),
    );
  }
}
