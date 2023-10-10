import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/categorymodel/remen_model_class.dart';
import 'package:food_delivery_app/provider/category_provider_class.dart';
import 'package:food_delivery_app/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

class SearchPageScreen extends StatefulWidget {
   SearchPageScreen({Key? key,}) : super(key: key);

  RemenModelClass? remenModelClass;

  @override
  State<SearchPageScreen> createState() => _SearchPageScreenState();
}

class _SearchPageScreenState extends State<SearchPageScreen> {

  List<RemenModelClass> remenModelClassList = RemenModelClass.categoryRemenList;

  List<RemenModelClass> searchList = [];

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
                ),
              ),

            //   ;
            // }),

            SizedBox(height: 10,),

            Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey,
            ),

            SizedBox(height: 10,),

            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index){
                      return Container(
                        height: 100,
                        width: double.infinity,

                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 2,
                            color: Colors.purple,
                          )
                        ),
                        child: Column(
                          children: [

                            Text("${searchList[index].name}"),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (_, index){
                      return SizedBox(height: 10,);
                    },
                    itemCount: searchList.length,
                ),
            ),



          ],
        ),
      ),
    );
  }
}
