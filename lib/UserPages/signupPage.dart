import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectsquc/UserPages/loginPage.dart';
import '../Util/AppData.dart';
import '../homePage.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  String get username => _usernameController.text.trim();
  String get email => _emailController.text.trim();
  String get password => _passwordController.text.trim();
  bool value=false;
  void checkBoxCallBack(bool? checkBoxState) {
    if (checkBoxState != null) {
      setState(() {
        value = checkBoxState;
      });
    }
  }
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
                              height: 250,
                            ),
                          ),
                          Text(
                            'welcome!',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Candara',

                            ),
                          ),
                          Card(
                            color: Colors.black12,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),

                            ),
                            child:TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  icon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.account_circle_rounded,
                                      size:30,),
                                  ),
                                  labelText: 'username'
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              controller: _usernameController,
                              //_ means null
                            ),),
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
                              FirebaseAuth.instance.createUserWithEmailAndPassword
                                (email: email, password: password).then((value) {

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => loginPage()));
                                AppData.UserName=username;
                              }).onError((error, stackTrace){
                                print("Error ${error.toString()}");
                                showAlertDialog1(context);


                              });


                            },
                            child: Text('signUp'),
                          ),
                          //============================================================
                          Row(
                            children: <Widget>[
                              Checkbox(
                                activeColor: Colors.blue,
                                value: value,
                                onChanged: checkBoxCallBack,
                              ),
                              TextButton(onPressed: (){},
                                child: Text('I agree with all terms and privacy',
                                  style: TextStyle(color:Colors.black54),
                                ),),
                            ],
                          ),
                          //============================================================
                          Text('already have account?'),
                          SizedBox(height: 5,),
                          FlatButton(
                            minWidth: 100,
                            height: 50,
                            color: Colors.white,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)
                            ),
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => loginPage()));

                            },
                            child: Text('Login'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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
    content: Text("The password should be from 6 characters and more & the email should be typed correct \n example@gmail.com "),
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