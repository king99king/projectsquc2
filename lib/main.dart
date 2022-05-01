import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projectsquc/fire_base.dart';
import 'package:projectsquc/setting&splashScreen/splashScreen.dart';
import 'package:projectsquc/setting&splashScreen/wellcomScreen.dart';
//import 'package:project/setting&splashScreen/wellcomScreen.dart';

//import 'UserPages/loginPage.dart';
//import 'UserPages/signupPage.dart';
import 'homePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: SplashScreen(),//FireBase(),
    );
  }
}