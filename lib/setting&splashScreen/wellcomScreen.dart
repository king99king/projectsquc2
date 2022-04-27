import 'package:flutter/material.dart';
import 'package:projectsquc/UserPages/loginPage.dart';
import 'package:projectsquc/homePage.dart';
import './userPage.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          color: Colors.grey[400],
          child: Stack(
            children:[
              Container(
                padding: EdgeInsets.all(100),
                height: 400,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.deepPurple.shade200, Colors.deepPurpleAccent],),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
                child: Image(image: AssetImage('assets/images/appLogo.png'),),

              ),

              Center(
                  child: Container(

                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                     top:30,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    width:300,
                    height: 150,
                    child: Column(
                      children: [
                        Text("Welcome to",
                        style: TextStyle(
                          fontSize:35,
                          color: Colors.black54,
                        )),
                        Text("SQUCloud",
                            style: TextStyle(
                              fontSize:35,
                              color: Colors.black54,
                            )),
                      ],
                    ),

                  ),

              ),
              Positioned(

                top: 530,
                right:110,
                child: FlatButton(
                  color: Colors.deepPurpleAccent,
                  height: 70,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),

                  onPressed:(){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) =>loginPage()));

                  },
                  child: Row(
                    children:[
                      Text('continue',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 30,
                      )),
                      Icon(Icons.arrow_forward,
                      size:30,
                      color: Colors.white),
                    ],
                  )

                ),
              ),

            ],
            overflow:Overflow.clip,

          )
        )

    );
  }
}








