import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/provider/language_change_controller_provider.dart';
import 'package:food_delivery_app/provider/theme_changer_provider.dart';
import 'package:food_delivery_app/screen/authentication/signin_page_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

enum Language {English, Bangla, Spanish}
class _MyDrawerState extends State<MyDrawer> {

  bool isLoading = false;

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final changetTheme = Provider.of<ThemeChangerProvider>(context);
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 17,
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 5),
              color: Colors.white,
              child: Column(
                children: [
                  //1st part
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 20,),

                          Text(AppLocalizations.of(context)!.dname,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),

                          Container(
                            height: 24,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              color: Colors.white,
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            child: Center(
                              child: Text(AppLocalizations.of(context)!.drf,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://pbs.twimg.com/profile_images/1605607703178403840/hvbe8OEE_400x400.jpg"),
                      ),

                      Consumer<LanguageChangeControllerProvider>(builder: (context, value, child){
                        return PopupMenuButton(itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[

                          PopupMenuItem(
                            value: Language.English,
                            child: Text("English"),),

                          PopupMenuItem(
                            value: Language.Bangla,
                            child: Text("Bangla"),),

                          PopupMenuItem(
                            value: Language.Spanish,
                            child: Text("Spanish"),),

                        ],
                          onSelected: (Language icon){

                          if(Language.English.name == icon.name){
                            value.changeLanguage(Locale("en"));
                          } else if(Language.Bangla.name == icon.name){
                            value.changeLanguage(Locale("bn"));
                          } else {
                            value.changeLanguage(Locale("es"));
                          }
                          },
                        );
                      })
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //2nd part
                  Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: Colors.blue[100],
                    ),
                    child: Center(
                      child: Text(AppLocalizations.of(context)!.dbav,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[400],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 14,
                  ),

                  //3rd part
                  DrawerItem2(
                    icon: Icons.home_outlined,
                    title: AppLocalizations.of(context)!.dmb,
                    num: 2,
                    onTap: (){},
                  ),

                  DrawerItem21(
                    icon: Icons.person,
                    title: AppLocalizations.of(context)!.dpro,
                    //num: 2,
                    onTap: (){},
                  ),

                  DrawerItem21(
                    icon: Icons.payment,
                    title: AppLocalizations.of(context)!.dpay,
                    //num: 2,
                    onTap: (){},
                  ),

                  DrawerItem21(
                    icon: Icons.card_giftcard_sharp,
                    title: AppLocalizations.of(context)!.dgb,
                    //num: 2,
                    onTap: (){},
                  ),

                  SizedBox(height: 14,),

                  Row(
                    children: [
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          shape: BoxShape.circle,
                        ),
                      ),

                      SizedBox(width: 5,),

                      Text(AppLocalizations.of(context)!.dp1,
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 5,),

                  Row(
                    children: [
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          shape: BoxShape.circle,
                        ),
                      ),

                      SizedBox(width: 5,),

                      Text(AppLocalizations.of(context)!.dp2,
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 5,),

                  Row(
                    children: [
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          shape: BoxShape.circle,
                        ),
                      ),

                      SizedBox(width: 5,),

                      Text(AppLocalizations.of(context)!.dp3,
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 5,),

                  Expanded(
                      flex: 2,
                      child: Column(
                    children: [
                      RadioListTile<ThemeMode>(
                          title: Text(AppLocalizations.of(context)!.dt1),
                          value: ThemeMode.light,
                          groupValue: changetTheme.themeMode,
                          onChanged: changetTheme.setTheme
                      ),

                      RadioListTile<ThemeMode>(
                          title: Text(AppLocalizations.of(context)!.dt2),
                          value: ThemeMode.dark,
                          groupValue: changetTheme.themeMode,
                          onChanged: changetTheme.setTheme
                      ),

                      RadioListTile<ThemeMode>(
                          title: Text(AppLocalizations.of(context)!.dt3),
                          value: ThemeMode.system,
                          groupValue: changetTheme.themeMode,
                          onChanged: changetTheme.setTheme
                      ),                    ],
                  ))
                ],
              ),
            ),
          ),
          Expanded(flex: 3, child: Container(
            child: Column(
              children: [
                ListTile(
                  title: Text(AppLocalizations.of(context)!.db1,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),

                  subtitle: Text(AppLocalizations.of(context)!.db2,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black38
                    ),
                  ),

                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      isLoading = true;
                    });
                    _auth.signOut().then((value){
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignInPageScreen()));
                    }).onError((error, stackTrace){
                      setState(() {
                        isLoading = false;
                      });
                      utails(error.toString());
                    });
                  },
                  child: isLoading == true ? CircularProgressIndicator() : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Logout"),
                      Icon(Icons.logout)
                    ],
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class DrawerItem2 extends StatelessWidget {

  DrawerItem2({this.icon, this.title, this.onTap, this.num});

  IconData? icon;
  String? title;
  VoidCallback? onTap;
  int? num;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${title}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Center(
                  child: Text("${num}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}


class DrawerItem21 extends StatelessWidget {

  DrawerItem21({this.icon, this.title, this.onTap,});

  IconData? icon;
  String? title;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "${title}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),



      ),
    );
  }
}
