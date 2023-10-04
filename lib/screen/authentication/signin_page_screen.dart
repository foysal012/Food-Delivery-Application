import 'package:flutter/material.dart';

class SignInPageScreen extends StatefulWidget {
  const SignInPageScreen({Key? key}) : super(key: key);

  @override
  State<SignInPageScreen> createState() => _SignInPageScreenState();
}

class _SignInPageScreenState extends State<SignInPageScreen> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  //TextEditingController _emailController = TextEditingController();

  bool isObsecureText = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
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
              onTap: (){},
              child: Container(
                height: 60,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.purple
                ),
                child: Center(child: Text("Submit")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
