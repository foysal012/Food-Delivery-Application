import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/provider/category_provider_class.dart';
import 'package:food_delivery_app/provider/language_change_controller_provider.dart';
import 'package:food_delivery_app/provider/theme_changer_provider.dart';
import 'package:food_delivery_app/screen/authentication/forget_password_page_screen.dart';
import 'package:food_delivery_app/screen/authentication/signin_page_screen.dart';
import 'package:food_delivery_app/screen/authentication/signup_page_screen.dart';
import 'package:food_delivery_app/screen/bottomnavbar/bottomnavigationbar_screen.dart';
import 'package:food_delivery_app/screen/home_page_screen.dart';
import 'package:food_delivery_app/screen/introduction/introduction_page_screen.dart';
import 'package:food_delivery_app/screen/introduction/introduction_page_screen1.dart';
import 'package:food_delivery_app/screen/messageing_page_screen.dart';
import 'package:food_delivery_app/screen/my_cart_page_screen.dart';
import 'package:food_delivery_app/screen/splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    )
  );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CategoryProviderClass()),
          ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
          ChangeNotifierProvider(create: (_) => LanguageChangeControllerProvider()),
        ],
      child: Builder(builder: (BuildContext context){
        final changeTheme = Provider.of<ThemeChangerProvider>(context);
        return Consumer<LanguageChangeControllerProvider>(builder: (contex, value, child){
          return MaterialApp(
            title: 'Flutter Demo',
           locale: value.appLocale,
            //locale: Locale("es"),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: [
              Locale("en"),
              Locale("bn"),
              Locale("es"),
            ],
            themeMode: changeTheme.themeMode,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              iconTheme: IconThemeData(
                color: Colors.teal,
              ),
              iconButtonTheme: IconButtonThemeData(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.teal)
                  )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.black38,
                elevation: 0,

              ),
              drawerTheme: DrawerThemeData(
                  backgroundColor: Colors.black38,
                  elevation: 5,
                  shadowColor: Colors.black12
              ),
              indicatorColor: Colors.white,
              radioTheme: RadioThemeData(
                fillColor: MaterialStatePropertyAll(Colors.pink),
                overlayColor: MaterialStatePropertyAll(Colors.orange),
              ),
              tabBarTheme: TabBarTheme(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
              ),
              hintColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
            //home: IntroductionPageScreen1(),
            //home: HomePageScreen(),
            home: BottomNavigationBarPageScreen(),
            //home: MyCartPageScreen(),
            //home: MessagingPageScreen(),
            //home: SignInPageScreen(),
            //home: SignUpPageScreen(),
            //home: ForgetPasswordPageScreen(),
            //home: SpalashScreen1(),
            //home: IntroductionPageScreen(),
          );
        });
      })
    );
  }
}
