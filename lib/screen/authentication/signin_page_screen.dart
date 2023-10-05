import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_app/screen/authentication/forget_password_page_screen.dart';
import 'package:food_delivery_app/screen/authentication/signup_page_screen.dart';
import 'package:food_delivery_app/screen/bottomnavbar/bottomnavigationbar_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPageScreen extends StatefulWidget {
  const SignInPageScreen({Key? key}) : super(key: key);

  @override
  State<SignInPageScreen> createState() => _SignInPageScreenState();
}

class _SignInPageScreenState extends State<SignInPageScreen> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  GlobalKey<FormState> _formKey = GlobalKey();

  bool isObsecureText = false;

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
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  height: 200,
                  width: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple[300],
                  ),
                  child: Center(
                    child: Text("Sign In",
                    style: GoogleFonts.lobster(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black,
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
                      borderSide: BorderSide(color: Colors.purple),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.purple),
                       borderRadius: BorderRadius.circular(10),
                    ),

                    labelText: "Email",
                    hintText: "example420@gmail.com",
                    prefixIcon: Icon(Icons.email_outlined)
                  ),
                ),

                SizedBox(height: 10,),

                TextFormField(
                  validator: (value) {
                    if(value!.isEmpty){
                      return "password field empty";
                    } else if(value.length > 15){
                      return "too long";
                    }else if(value.length < 8){
                      return "too short";
                    }
                  },
                  controller: _passwordController,
                  obscureText: isObsecureText,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      labelText: "Password",
                      hintText: "****************",
                      prefixIcon: Icon(Icons.lock),

                    suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            isObsecureText = ! isObsecureText;
                          });
                        },
                        icon: Icon(isObsecureText == true? Icons.visibility_off : Icons.visibility)
                    ),
                  ),
                ),

                SizedBox(height: 20,),

                InkWell(
                  onTap: (){
                    if(_formKey.currentState!.validate()){

                      print("Successfully Login...");
                      print("Your email is: ${_emailController.text}");
                      print("Your password is: ${_passwordController.text}");
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Login...")));

                      setState(() {
                        isLoading = true;
                      });
                      _auth.signInWithEmailAndPassword(
                          email: _emailController.text.toString(),
                          password: _passwordController.text.toString(),
                      ).then((value){
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomNavigationBarPageScreen() ));
                      }).onError((error, stackTrace) {
                        setState(() {
                          isLoading = false;
                        });
                        utails(error.toString());
                      });
                    } else{
                      setState(() {
                        isLoading = false;
                      });
                      print("Faild to Login...");
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Faild to Login...")));
                    }
                  },
                  child: Container(
                    height: 65,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.purple[500]
                    ),
                    child: Center(
                      child: isLoading == true ? CircularProgressIndicator() : Text("Sign in",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Row(children: [

                  Text("Don't have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(width: 5,),

                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPageScreen() ));
                    },
                    child: Text("Clik here",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                    ),
                  )
                ],),

                SizedBox(
                  height: 20,
                ),

                Row(children: [

                  Text("Forgot Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(width: 5,),

                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgetPasswordPageScreen() ));
                    },
                    child: Text("Clik here",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  )
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void utails(String? msg){
   Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}