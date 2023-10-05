import 'package:flutter/material.dart';

class ForgetPasswordPageScreen extends StatefulWidget {
  const ForgetPasswordPageScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPageScreen> createState() => _ForgetPasswordPageScreenState();
}

class _ForgetPasswordPageScreenState extends State<ForgetPasswordPageScreen> {

  TextEditingController _emailController = TextEditingController();

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

            SizedBox(height: 20,),

            InkWell(
              onTap: (){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Send link to your email...")));
                    Navigator.of(context).pop();
              },
              child: Container(
                height: 65,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.purple[500]
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
