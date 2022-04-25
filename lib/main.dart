import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projectsquc/fire_base.dart';
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
      title: '',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),//FireBase(),
    );
  }
}
class Homepage1 extends StatelessWidget {
  const Homepage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}