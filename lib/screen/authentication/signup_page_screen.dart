

import 'package:flutter/material.dart';
import 'package:food_delivery_app/screen/authentication/signin_page_screen.dart';
import 'package:food_delivery_app/screen/bottomnavbar/bottomnavigationbar_screen.dart';

class SignUpPageScreen extends StatefulWidget {
  const SignUpPageScreen({Key? key}) : super(key: key);

  @override
  State<SignUpPageScreen> createState() => _SignUpPageScreenState();
}

class _SignUpPageScreenState extends State<SignUpPageScreen> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();

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
        //color: Colors.grey,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    labelText: "Name",
                    hintText: "Mr. OMOK",
                    prefixIcon: Icon(Icons.abc),
                ),
              ),

              SizedBox(height: 10,),

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

              SizedBox(height: 10,),

              TextFormField(
                controller: _confirmpasswordController,
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
                  // if(_formKey.currentState!.validate()){
                  //   if(_passwordController == _confirmpasswordController){
                  //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignInPageScreen()));
                  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Sign up...")));
                  //   } else {
                  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to Signup...")));
                  //
                  //   }
                  // }
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Sign up...")));
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInPageScreen()));

                },
                child: Container(
                  height: 65,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.purple[500]
                  ),
                  child: Center(child: Text("Sign up",
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
      ),
    );
  }
}
