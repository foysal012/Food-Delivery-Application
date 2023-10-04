import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 30,
          bottom: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  height: 60,
                width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage("images/w2.png"))
                  ),
                ),

                SizedBox(width: 10,),

                Text(AppLocalizations.of(context)!.profile,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                ),
                )
              ],
            ),
            
            SizedBox(height: 10,),

            Row(
              children: [

                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green.withOpacity(0.8),
                  ),
                  child: Center(
                    child: Text(AppLocalizations.of(context)!.pspro,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    ),
                  ),
                ),

                SizedBox(width: 10,),

                Column(
                  children: [
                    Text(AppLocalizations.of(context)!.psname,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    Text("foysal062@gmail.com",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                    ),
                ],
                ),


              ],
            ),

            SizedBox(height: 20),

            Container(
              height: 70,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.withOpacity(0.3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.psbalance,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  Text("1000",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Container(
              height: 70,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.withOpacity(0.3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.pspoint,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("376",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Container(
              height: 70,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.withOpacity(0.3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.pspayement,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(AppLocalizations.of(context)!.psopayment,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Container(
              height: 70,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.withOpacity(0.3),
              ),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.help,color: Colors.green,),

                  SizedBox(width: 20,),

                  Text(AppLocalizations.of(context)!.pshs,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Container(
              height: 70,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.withOpacity(0.3),
              ),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.security,color: Colors.green,),

                  SizedBox(width: 20,),

                  Text(AppLocalizations.of(context)!.pssp,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
