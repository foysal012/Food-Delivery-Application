import 'package:flutter/material.dart';
import 'package:food_delivery_app/screen/authentication/forget_password_page_screen.dart';
import 'package:food_delivery_app/screen/authentication/signup_page_screen.dart';
import 'package:food_delivery_app/screen/bottomnavbar/bottomnavigationbar_screen.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [



              TextFormField(
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomNavigationBarPageScreen() ));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Login...")));
                  }
                },
                child: Container(
                  height: 65,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.purple[500]
                  ),
                  child: Center(child: Text("Sign in",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                  ),
                  )),
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
    );
  }
}
