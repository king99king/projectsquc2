import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projectsquc/UserPages/signupPage.dart';

import '../homePage.dart';


class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get email => _emailController.text.trim();
  String get password => _passwordController.text.trim();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/loginBg.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),

        Scaffold(

          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: ListView(
              scrollDirection:  Axis.vertical,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      // width: double.infinity,
                      // height: 50,
                      // color: Colors.blue,
                      child: Column(
                        children: <Widget>[
                          Center(
                            child:Image.asset('assets/images/appLogo.png',
                              width: 300,
                              height: 300,
                            ),
                          ),
                          //============================================================
                          Text(
                            'welcome again!',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Candara',

                            ),
                          ),
                          //============================================================
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.black12,
                            child: TextField(
                              //  autofillHints:[AutofillHints.name] ,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                //  hintText:'Name' ,
                                icon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.email,
                                    size:30,),
                                ),
                                labelText: 'email',
                              ),
                              keyboardType: TextInputType.text,
                              controller: _emailController,
                            ),
                          ),
                          //==============================================================
                          Card(
                            color: Colors.black12,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),

                            ),
                            child:TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  icon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.lock,
                                      size:30,),
                                  ),
                                  labelText: 'password'
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              controller: _passwordController,
                              //_ means null
                            ),),
                          //============================================================
                          FlatButton(
                            minWidth: 300,
                            height: 50,
                            color: Colors.black54,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)
                            ),
                            onPressed: (){
                              FirebaseAuth.instance.signInWithEmailAndPassword
                                (email: email, password: password).then((value){
                                Navigator.push(context,MaterialPageRoute(
                                    builder: (context) => HomePage()
                                ));
                              }).onError((error, stackTrace) {
                                print("Error ${error.toString()}");
                                showAlertDialog1(context);
                              }


                              );


                            },
                            child: Text('Login'),
                          ),
                          //============================================================

                          TextButton(onPressed: (){},
                            child: Text('Forgot password?',
                              style: TextStyle(color:Colors.black54),),),
                          //============================================================
                          Text('you don\'t have account?'),
                          SizedBox(height: 5,),
                          FlatButton(
                            minWidth: 100,
                            height: 50,
                            color: Colors.white,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)
                            ),
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => SignupPage()));
                            },
                            child: Text('Create'),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),],),
          ),),
      ],
    );
  }
}

showAlertDialog1(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: ()=> Navigator.pop(context),

  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("alert!"),
    content: Text("The user not found, please sign up first.\n ✋or the password or email is incorrect"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}