import 'package:flutter/material.dart';
import 'package:food_delivery_app/screen/introduction/introduction_page_screen.dart';
import 'package:food_delivery_app/screen/introduction/introduction_page_screen1.dart';
import 'package:google_fonts/google_fonts.dart';

class SpalashScreen1 extends StatefulWidget {
  const SpalashScreen1({Key? key}) : super(key: key);

  @override
  State<SpalashScreen1> createState() => _SpalashScreen1State();
}

class _SpalashScreen1State extends State<SpalashScreen1> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 2),(){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> IntroductionPageScreen()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(

      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.teal
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage("images/w2.png"),)
              ),
              //child: Image.asset("images/w2.png"),
            ),

            Text("Food Chain",
            style: GoogleFonts.lobster(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
            )
          ],
        ),
      ),

    );
  }
}
