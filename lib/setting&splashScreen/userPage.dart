import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectsquc/homePage.dart';
import 'package:projectsquc/setting&splashScreen/wellcomScreen.dart';

import '../Util/AppData.dart';


class user extends StatelessWidget {
  const user({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            color: Colors.grey[300],
            child: Column(
              children:[
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                    image: DecorationImage(image: AssetImage('assets/images/bg1.png'),
                    fit: BoxFit.cover),
                  ),
                  child: Column(children:[
                    SizedBox(height: 20),
                    ListTile(
                      leading: IconButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        icon:Icon(Icons.arrow_back),
                        iconSize:40,
                        color: Colors.white,
                      ),
                      trailing: IconButton(
                        onPressed: (){},
                        icon:Icon(Icons.dehaze_outlined),
                        iconSize:40,
                        color: Colors.white,

                      )
                    ),
                    Center(
                      child:CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent,
                        radius: 70,
                        child:Icon(Icons.account_circle_rounded,size: 140,color:Colors.white),
                      ),
                    ),
                    Center(
                      child: Text(AppData.UserName.toString(),
                      style: TextStyle(
                        fontSize: 30,
                      ))
                    )

                  ],),
                ),

                SizedBox(height:50),
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
              //Donations
                Row(children:[
                  SizedBox(width:30),
                  Icon(CupertinoIcons.money_dollar_circle_fill,size:40,color:Colors.deepPurple),

                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                     textStyle: const TextStyle(fontSize: 30),
                       ),
                      onPressed: (){},
            child: const Text('donations'),
          ),
                ]),
                SizedBox(height:15),
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
              //My Videos
                Row(children:[
                  SizedBox(width:30),
                  Icon(Icons.video_collection,size:40,color:Colors.deepPurple),

                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle: const TextStyle(fontSize: 30),
                    ),
                    onPressed: (){
//****************************************************
                    //  Navigator.push(context,
                       //   MaterialPageRoute(builder: (context) => youtube()));//*******************************


//******************************************************************************

                    },
                    child: const Text('my videos'),
                  ),
                ]),
                SizedBox(height:15),
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                //Change Password
                Row(children:[
                  SizedBox(width:30),
                  Icon(Icons.lock,size:40,color:Colors.deepPurple),

                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle: const TextStyle(fontSize: 30),
                    ),
                    onPressed: (){},
                    child: const Text('change password'),
                  ),
                ]),
                SizedBox(height:15),
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                //Logout
                Row(children:[
                  SizedBox(width:30),
                  Icon(Icons.logout,size:40,color:Colors.deepPurple),

                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle: const TextStyle(fontSize: 30),
                    ),
                    onPressed: (){},
                    child: const Text('logout'),
                  ),
                ]),
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

              ],
            )
          ),

      )
    );
  }
}





