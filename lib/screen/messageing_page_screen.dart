import 'dart:async';

import 'package:flutter/material.dart';

class MessagingPageScreen extends StatefulWidget {
  const MessagingPageScreen({Key? key}) : super(key: key);

  @override
  State<MessagingPageScreen> createState() => _MessagingPageScreenState();
}

class _MessagingPageScreenState extends State<MessagingPageScreen> {

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,

        height: double.infinity,
        width: double.infinity,

        child: Column(
          children: [

            SizedBox(
              height: 20,
            ),

            Text("Welcome to Food_Chain\n     Custormer Service",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 25,
            ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              height: 120,
              width: 300,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20
              ),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                borderRadius: BorderRadius.circular(60),

              ),

              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, color: Colors.green,),

                      SizedBox(width: 3,),

                      Text("Rahul Reza",
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      ),

                      SizedBox(width: 3,),

                      Container(
                        height: 20,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                              height: 9,
                              width: 9,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            ),

                            SizedBox(width: 5,),

                            Text("online"),


                          ],
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 3,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.timelapse_outlined,color: Colors.green,),

                      SizedBox(width: 5),

                      Text("working time: 6.00am - 9.00pm GMT+6",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                      ),
                      )
                    ],
                  ),

                  SizedBox(height: 3,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.call_outlined,color: Colors.green,),

                      SizedBox(width: 5),

                      Text("+658486605 (WhatsApp)",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              height: 4,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),

              ),
            ),

            SizedBox(height: 10,),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Container(
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )
                  ),
                  child: Center(
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 200,
                          maxWidth: 200,
                        ),
                      child: Text("বেশি সমস্যা মনে হলে Whatsapp Massage করুন নম্বার 01919084813। অডার করার পর 5-20 মিনিট এর মাঝে Live Chat করুন। কোন সমস্যা ছাড়া অযখা মেসেজ দিবেন না। যদি কোন কারণ ছাড়া মেসেজ দিন তাহলে আপনার Live Chat বন্ধ হয়ে যেতে পারে।"),
                    ),
                  ),
                ),

                SizedBox(width: 3,),

                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage("images/w5.png"))
                  ),
                )
              ],
            ),

            //SizedBox(height: 30,),

            Expanded(
              child:

                  TextFormField(
                    controller: textController,
                decoration: InputDecoration(
                  hintText: "Chat",
                  suffixIcon:
                      Icon(Icons.send,),
                ),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
