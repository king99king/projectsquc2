import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projectsquc/UserPages/signupPage.dart';


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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading:IconButton(onPressed: ()=>Navigator.pop(context),
            icon:Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 45,
            )
        ),
       actions: <Widget>[
         IconButton(onPressed: (){},
             icon:Icon(
               Icons.format_list_bulleted_outlined,
               color: Colors.white,
             )
         )
       ],
      ),
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
                    onPressed: (){},
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
