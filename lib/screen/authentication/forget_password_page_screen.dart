import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screen/authentication/signin_page_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordPageScreen extends StatefulWidget {
  const ForgetPasswordPageScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPageScreen> createState() => _ForgetPasswordPageScreenState();
}

class _ForgetPasswordPageScreenState extends State<ForgetPasswordPageScreen> {

  TextEditingController _emailController = TextEditingController();

  bool isLoading = false;

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        //color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff528265).withOpacity(0.6),
              ),
              child: Center(
                child: Center(
                  child: Text("Reset\nPassword",
                    style: GoogleFonts.lobster(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            TextFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return "email field empty";
                } else if(value.length > 25){
                  return "too long";
                }else if(value.length < 12){
                  return "too short";
                }else if(!value.contains("@")){
                  return "too long";
                }else if(!value.endsWith("gmail.com")){
                  return "too long";
                }
              },
              controller: _emailController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff528265)),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff528265)),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  labelText: "Email",
                  hintText: "example420@gmail.com",
                  prefixIcon: Icon(Icons.email_outlined)
              ),
            ),

            SizedBox(height: 20,),

            InkWell(
              onTap: (){
                setState(() {
                  isLoading = true;
                });
                _auth.sendPasswordResetEmail(email: _emailController.text.toString()).then((value){
                  setState(() {
                    isLoading = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Send link to your email...")));
                  print("Successfully Send link to your email...");
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignInPageScreen()));
                }).onError((error, stackTrace){
                  setState(() {
                    isLoading = false;
                  });
                  print(error.toString());
                  utails(error.toString());
                });

              },
              child: Container(
                height: 65,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff528265)
                ),
                child: Center(child: Text("Reset",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
