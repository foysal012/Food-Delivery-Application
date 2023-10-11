import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/model/categorymodel/remen_model_class.dart';
import 'package:food_delivery_app/provider/category_provider_class.dart';
import 'package:food_delivery_app/provider/theme_changer_provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class SearchPageScreen extends StatefulWidget {
   SearchPageScreen({Key? key,}) : super(key: key);


  @override
  State<SearchPageScreen> createState() => _SearchPageScreenState();
}

class _SearchPageScreenState extends State<SearchPageScreen> {

  List<RemenModelClass> remenModelClassList = RemenModelClass.categoryRemenList;

  List<RemenModelClass> searchList = [];

  FocusNode focusNode = FocusNode();

  List<String> poularList = [
    "sapporo miso",
    "kurume ramen",
    "jutikla mile",
  ];

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 10,
          right: 10,
          bottom: 10,
        ),

        child: Column(
          children: [
            // Consumer<CategoryProviderClass>(builder: (context, value, child){
            //
            //   return

                TextFormField(
                controller: _searchController,
                focusNode: focusNode,
                onChanged: (valued){
                  setState(() {
                    remenModelClassList.forEach((element) =>
                    element.name!.toLowerCase().contains(_searchController.text.toString().toLowerCase()) == true ?
                        searchList.add(RemenModelClass(
                          name: element.name,
                          rating: element.rating,
                          imgUrl: element.imgUrl,
                          distance: element.distance,
                          price: element.price,
                        ))
                        :
                      {

                      }

                    );
                  });
                },

                  onEditingComplete: (){
                    remenModelClassList.forEach((element) =>
                    element.name!.toLowerCase().contains(_searchController.text.toString().toLowerCase()) == true ?
                    searchList.add(RemenModelClass(
                      name: element.name,
                      rating: element.rating,
                      imgUrl: element.imgUrl,
                      distance: element.distance,
                      price: element.price,
                    ))
                        :
                    {

                    }

                    );
                  },

                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: Icon(Icons.search, color: Color(0xff01765),),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xff01765),
                      width: 2,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color(0xff01765),
                      width: 2,
                    ),
                  ),
                  labelText: "Search Food",
                  suffixIcon: IconButton(
                      onPressed: (){
                        focusNode.unfocus();
                        //focusNode.nextFocus();
                        setState(() {

                        });
                      },
                      icon: Icon(Icons.close, color: Colors.red,)
                  )
                ),
              ),

            //   ;
            // }),

            SizedBox(height: 10,),

            Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey[200],

              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: MasonryGridView.count(
                  itemCount: poularList.length,
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    itemBuilder: (context, index){
                      return InkWell(
                          onTap: (){

                              _searchController.text = poularList[index].toLowerCase() ;
                            setState(() {

                            });
                          },
                          child: Text("${poularList[index]}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                          ),
                      );
                }),
              )
            ),

            SizedBox(height: 10,),

            Expanded(
                child:
                //searchList.isNotEmpty ?
                _searchController.text.toString() != null ?
                ListView.separated(
                  scrollDirection: Axis.vertical,
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
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(25),

                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(child: Image(image: AssetImage("${searchList[index].imgUrl}"), height: 170,width: 170,)),

                              SizedBox(height: 8,),

                              Center(child: Text("${searchList[index].name}",
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

                                      Text("${searchList[index].rating}",
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

                                      Text("${searchList[index].distance}",
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

                              Text("${searchList[index].price}",
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

                                  value.allDataList.contains(searchList[index]) == false ?

                                  value.setAddItemList(RemenModelClass(
                                      imgUrl: searchList[index].imgUrl,
                                      name: searchList[index].name,
                                      rating: searchList[index].rating,
                                      distance: searchList[index].distance,
                                      price: searchList[index].price
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
                  itemCount: searchList.length,
                  //itemCount: categoryProviderClass.allDataList.length,
                ) :  SizedBox()
            )



          ],
        ),
      ),
    );
  }
}
