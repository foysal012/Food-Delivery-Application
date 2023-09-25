import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/categorymodel/remen_model_class.dart';
import 'package:food_delivery_app/screen/home_page_screen.dart';

class MyCartPageScreen extends StatefulWidget {
  const MyCartPageScreen({Key? key}) : super(key: key);



  @override
  State<MyCartPageScreen> createState() => _MyCartPageScreenState();
}

class _MyCartPageScreenState extends State<MyCartPageScreen> {

  var allData = RemenModelClass.categoryRemenList;

   List<String> list = <String>['Bkash', 'Rocket', 'Nagad', 'Upay', "Online Bank", "Visa Card", "Master Card"];

   TextEditingController dateController = TextEditingController();
  
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,

        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 20,
          bottom: 10,
        ),

        color: Colors.grey[100],

        child: Column(
          children: [

            Row(
              children: [

                IconButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePageScreen()));
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.black,),
                ),

                SizedBox(width: 110,),

                Text("My Cart",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20
                  ),
                ),

              ],
            ),

            SizedBox(height: 20,),

            Expanded(
              flex: 6,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return Container(
                      height: 200,
                      width: double.infinity,

                      child:Row(
                        children: [
                          Image(image: AssetImage("${allData[index].imgUrl}"),
                            height: 180,
                          width: 180,
                          ),

                          SizedBox(width: 10,),

                          Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("${allData[index].name}",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black87,
                                fontWeight: FontWeight.w800
                              ),
                              ),

                              SizedBox(height: 18,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.orange,),

                                      SizedBox(width: 2,),

                                      Text("${allData[index].rating}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black38,
                                            fontSize: 20
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(width: 10,),

                                  Row(
                                    children: [
                                      Icon(Icons.location_on, color: Colors.pinkAccent,),

                                      SizedBox(width: 2,),

                                      Text("${allData[index].distance}",
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

                              SizedBox(height: 18,),

                              Row(
                                children: [
                                  Text("${allData[index].totalAmount == null ?
                                  allData[index].price : allData[index].totalAmount}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 22
                                    ),
                                  ),

                                  SizedBox(width: 15,),

                                  Row(
                                    children: [

                                      InkWell(
                                        onTap:(){
                                          setState(() {
                                            if(allData[index].item <= 1){

                                            } else{
                                              allData[index].item--;
                                              print("Prices Decreases");
                                              allData[index].totalAmount = (allData[index].price! * allData[index].item).toInt();
                                              getTotalPrice();
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.black54,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(Icons.remove,color: Colors.white,),
                                        ),
                                      ),

                                      SizedBox(width: 5,),

                                      Text("${allData[index].item}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                      ),
                                      ),

                                      SizedBox(width: 5,),

                                      InkWell(
                                        onTap:(){
                                          setState(() {
                                            allData[index].item++;
                                            print("Price increases");
                                            allData[index].totalAmount = (allData[index].price! * allData[index].item).toInt();
                                            getTotalPrice();
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.black54,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(Icons.add,color: Colors.white,),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, index){
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 5
              ),
            ),

            SizedBox(height: 20,),

            Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  width: double.infinity,
                  color: Colors.white,

                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Text("--------------------------------",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Text("\$ ${deliveryCharge}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Order",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          ),
                          Text("-------------------------------",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Text("\$ ${subTotalPrice}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20,),

                      InkWell(
                        onTap: (){
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: Text("Payment Description"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Please choose a payment method:"),

                               SizedBox(height: 10,),

                                DropdownMenu<String>(
                                  initialSelection: list.first,
                                  onSelected: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      dropdownValue = value!;
                                    });
                                  },
                                  dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                                    return DropdownMenuEntry<String>(value: value, label: value);
                                  }).toList(),
                                ),

                                SizedBox(
                                  height: 15,
                                ),

                                InkWell(
                                  onTap: (){
                                    showDialog(context: context, builder: (context)
                                      {
                                       return AlertDialog(
                                          title: Text("Account  Details"),
                                          content:Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextFormField(
                                                decoration: InputDecoration(
                                                  label: Text("Account/Card No."),
                                                  hintText: "01736******/10515188********",

                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(
                                                      color: Colors.pink,
                                                      width: 3
                                                    ),
                                                  ),

                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(
                                                        color: Colors.pink,
                                                        width: 3
                                                    ),
                                                  ),

                                                ),
                                              ),

                                              SizedBox(height: 6,),

                                              TextFormField(
                                                decoration: InputDecoration(
                                                  label: Text("password/pin No."),
                                                  hintText: "**************",

                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(
                                                        color: Colors.pink,
                                                        width: 3
                                                    ),
                                                  ),

                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(
                                                        color: Colors.pink,
                                                        width: 3
                                                    ),
                                                  ),

                                                ),
                                              ),

                                              SizedBox(height: 6,),

                                              TextFormField(
                                                decoration: InputDecoration(
                                                  label: Text("CVV No."),
                                                  hintText: "***",

                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(
                                                        color: Colors.pink,
                                                        width: 3
                                                    ),
                                                  ),

                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(
                                                        color: Colors.pink,
                                                        width: 3
                                                    ),
                                                  ),

                                                ),
                                              ),

                                              SizedBox(height: 6,),

                                              TextFormField(
                                                controller:dateController,
                                                onTap: () async{
                                                  var selectedDate = DateTime.now();
                                              final  DateTime? picked = await showDatePicker(
                                                  context: context,
                                                    initialDate: selectedDate,
                                                    firstDate: DateTime(1971),
                                                    lastDate: DateTime(2050)
                                              );

                                              if (picked != null){
                                                setState(() {
                                                  selectedDate = picked;
                                                  var lab = formatDate(selectedDate, [yyyy, '-', mm, '-', dd]);
                                                  dateController.text = lab;
                                                  print(dateController);
                                                });
                                              } else{

                                              }

                                                },
                                                decoration: InputDecoration(
                                                  label: Text("Expery Date"),
                                                  hintText: "${DateTime.now().year}" + ":" "${DateTime.now().month}" + ":" "${DateTime.now().day}",

                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(
                                                        color: Colors.pink,
                                                        width: 3
                                                    ),
                                                  ),

                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(
                                                        color: Colors.pink,
                                                        width: 3
                                                    ),
                                                  ),

                                                ),
                                              ),

                                              SizedBox(height: 10,),

                                              InkWell(
                                                onTap: (){
                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment sucessfully Done...")));
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: Colors.pink,
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Center(child: Text("Pay",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  )),
                                                ),
                                              )


                                            ],
                                          )
                                          );
                                      });
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("Continue",
                                      style: TextStyle(
                                          color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),),),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(15),

                          ),
                          child: Center(child: Text("Pay \$${subTotalPrice+deliveryCharge}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22
                            ),
                          )),
                        ),
                      )
                    ],
                  ),

                )),
          ],
        ),
      ),
    );
  }
  var subTotalPrice = 0;

  var deliveryCharge = 10;

  void getTotalPrice(){
    var total = 0;

    allData.forEach((element) {
      total = total +( element.totalAmount ?? element.price )!;
      print("total price is $total");
    });

    setState(() {
      subTotalPrice = total ;
      print("SubtotalPrice is ${subTotalPrice}");
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    getTotalPrice();
    super.initState();
  }

}

