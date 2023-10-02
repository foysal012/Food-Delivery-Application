import 'package:flutter/material.dart';
import 'package:food_delivery_app/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final changetTheme = Provider.of<ThemeChangerProvider>(context);
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 9,
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
                          Text(
                            "Foysal Joarder",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 30,
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
                              child: Text(
                                "Refer Friends",
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
                      )
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
                      child: Text(
                        "Book a vehicle",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[400],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //3rd part
                  DrawerItem2(
                    icon: Icons.home_outlined,
                    title: "My Bookings",
                    num: 2,
                    onTap: (){},
                  ),

                  DrawerItem21(
                    icon: Icons.person,
                    title: "Profile",
                    //num: 2,
                    onTap: (){},
                  ),

                  DrawerItem21(
                    icon: Icons.payment,
                    title: "Payments",
                    //num: 2,
                    onTap: (){},
                  ),

                  DrawerItem21(
                    icon: Icons.card_giftcard_sharp,
                    title: "Gieft & Bonuses",
                    //num: 2,
                    onTap: (){},
                  ),

                  SizedBox(height: 30,),

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

                      Text("Have Questions?",
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 8,),

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

                      Text("About Services",
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 8,),

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

                      Text("Terms of Usage",
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 8,),

                  RadioListTile<ThemeMode>(
                    title: Text("Light Theme"),
                      value: ThemeMode.light,
                      groupValue: changetTheme.themeMode,
                      onChanged: changetTheme.setTheme
                  ),

                  RadioListTile<ThemeMode>(
                      title: Text("Dark Theme"),
                      value: ThemeMode.dark,
                      groupValue: changetTheme.themeMode,
                      onChanged: changetTheme.setTheme
                  ),

                  RadioListTile<ThemeMode>(
                      title: Text("System Theme"),
                      value: ThemeMode.system,
                      groupValue: changetTheme.themeMode,
                      onChanged: changetTheme.setTheme
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 1, child: Container(
            child: ListTile(
              title: Text("Become a Superuser",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),

              subtitle: Text("Earn money with a design",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38
                ),
              ),

              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
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
