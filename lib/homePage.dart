import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectsquc/UserPages/loginPage.dart';
import 'package:projectsquc/secondScreens/events.dart';
import 'package:projectsquc/secondScreens/squ_instructors.dart';
import 'package:projectsquc/secondScreens/squ_students.dart';
import 'package:projectsquc/secondScreens/test_bank.dart';
import 'package:projectsquc/secondScreens/youtube.dart';
import 'package:projectsquc/setting&splashScreen/userPage.dart';

import 'UserPages/signupPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
            child: Container(
              color: Colors.purple.shade50,
              child: Column(
                  children:<Widget>[
                    Container(
                        width: double.infinity,
                        height: 290,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          image: DecorationImage(
                              image: AssetImage('assets/images/bg1.png'),
                              fit: BoxFit.cover),
                        ),
                        child:Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Image.asset('assets/images/appLogo.png',width: 80,),
                                SizedBox(width: 250,),
                                IconButton(onPressed: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => user()));
                                },
                                  icon:Icon(
                                    Icons.person_outline_sharp,
                                    color: Colors.white,
                                    size: 40,
                                  ),),
                              ],
                            ),
                            SizedBox(height:10,),
                            Text('SQUCloud',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Candara'
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.all(10),
                              width: double.infinity,
                              height: 150,
                              child:InkWell(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => events()));
                                },
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        color: Colors.white,
                                      ),
                                      margin: EdgeInsets.fromLTRB(0,25,0,0),
                                      padding: EdgeInsets.fromLTRB(15, 20, 0,0),
                                      width: double.infinity,
                                      height:200,
                                      child:Row(
                                          children:<Widget>[
                                            Text(
                                              'E  V  E  N  T  S',style: TextStyle(
                                              fontFamily: 'Candara',
                                              fontSize: 30,
                                            ),
                                            ),
                                            SizedBox(width: 55,),
                                            Image.asset('assets/images/events.png',
                                              width: 130,height: 140,),
                                          ]),

                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),

                                        child:Container(
                                          color: Colors.purple.shade300,
                                          width: 70,
                                          child:Image.asset(
                                            'assets/images/calender.png',
                                            fit: BoxFit.fitWidth,
                                          ),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                    SizedBox(height: 30,),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children:<Widget> [
                          InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => students()));
                            },
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/bg1.png'),
                                        fit: BoxFit.cover),

                                  ),
                                  margin: EdgeInsets.fromLTRB(10,30,10,0),
                                  width: 300,
                                  height:200,
                                  child: Text(
                                    '\nSQU\n Students \n videos',style: TextStyle(
                                    fontFamily: 'Candara',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                    textAlign: TextAlign.center,),
                                  alignment: Alignment.center,
                                ),
                                Align(

                                  alignment: Alignment.topCenter,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.purple.shade300,
                                    child: Image.asset(
                                      'assets/images/student.png',
                                      fit: BoxFit.scaleDown,
                                      width:45,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => instructors()));
                            },
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/bg1.png'),
                                        fit: BoxFit.cover),
                                  ),
                                  margin: EdgeInsets.fromLTRB(10,30,10,0),
                                  width: 300,
                                  height:200,
                                  child:  Text(
                                    '\nSQU\n Instructors \n videos',style: TextStyle(
                                    fontFamily: 'Candara',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                    textAlign: TextAlign.center,),
                                  alignment: Alignment.center,
                                ),
                                Align(

                                  alignment: Alignment.topCenter,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.purple.shade300,
                                    child: Image.asset(
                                      'assets/images/teacher.png',
                                      fit: BoxFit.scaleDown,
                                      width:55,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => youtube()));
                            },
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/bg1.png'),
                                        fit: BoxFit.cover),
                                  ),
                                  margin: EdgeInsets.fromLTRB(10,30,10,0),
                                  width: 300,
                                  height:200,
                                  child: Text(
                                    '\nYoutube \n videos',style: TextStyle(
                                    fontFamily: 'Candara',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                    textAlign: TextAlign.center,),
                                  alignment: Alignment.center,
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.purple.shade300,
                                    child: Image.asset(
                                      'assets/images/YouTube.png',
                                      fit: BoxFit.scaleDown,
                                      width:45,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => testBank()));
                            },
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/bg1.png'),
                                        fit: BoxFit.cover),
                                  ),
                                  margin: EdgeInsets.fromLTRB(10,30,10,0),
                                  width: 300,
                                  height:200,
                                  child: Text(
                                    '\nTests \nBank',style: TextStyle(
                                    fontFamily: 'Candara',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                    textAlign: TextAlign.center,),
                                  alignment: Alignment.center,
                                ),
                                Align(

                                  alignment: Alignment.topCenter,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.purple.shade300,
                                    child: Image.asset(
                                      'assets/images/testbank.png',
                                      fit: BoxFit.scaleDown,
                                      width:55,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )

                  ]
              ),
            )
        )
    );
  }
}
