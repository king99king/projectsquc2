import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projectsquc/AddPages/NewEvent.dart';
import 'package:projectsquc/modulus/class.dart';

import '../homePage.dart';


class events extends StatefulWidget {
  //const events({Key? key}) : super(key: key);

  @override
  _eventsState createState() => _eventsState();
}

class _eventsState extends State<events> {

  static List<events_class> _eventsList = [
/*  events_class(
      title:
        'Intro to python',
        person:
        'Mohammed Ahmed',
        location:
        'lab s22',
        time:
        '7:00 pm',
        date:
        '17/6/2022'
    ),events_class(
        title:
        'Intro to python',
        person:
        'Mohammed Ahmed',
        location:
        'lab s22',
        time:
        '7:00 pm',
        date:
        '17/6/2022'
    ),
    events_class(
        'Intro to python',
        'Mohammed Ahmed',
        'lab s22',
        '7:00 pm',
        '17/6/2022'
    ),
    events_class(
        'Intro to python',
        'Mohammed Ahmed',
        'lab s22',
        '7:00 pm',
        '17/6/2022'
    ),*/

  ];

  void _addNewEvent(String course, String inst,String place, String time, String Date){
    final newEv= events_class(
      title: course,
      person: inst,
      time: time,
      location:place,
      date: Date,

    );
    setState(() {
      _eventsList.add(newEv);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.grey[400],
        child: Column(

          children:[
            Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.deepPurple.shade200, Colors.deepPurpleAccent],),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
              ),
              child: Column(
                children:[
                  SizedBox(height: 20),
                  ListTile(leading: IconButton(
                    onPressed: ()=>Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    iconSize:40,
                    color: Colors.white,
                  ),

                    title: Image(image: AssetImage('assets/images/appLogo.png'),height:60,fit:BoxFit.fitHeight),


                      trailing: IconButton(
                        onPressed: (){},
                        icon:Icon(Icons.account_circle_rounded),
                        iconSize:40,
                        color: Colors.white,

                      )
                  ),
                  Center(
                    child: Text("Events:", style:TextStyle(fontSize:50,)),
                  ),

                  SizedBox(height:30),

                  Center(
                  child: Container(
                  width: 300,
                    decoration:BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    child:TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        icon:Padding(padding: const EdgeInsets.all(8),
                          child: Icon(Icons.search, size:30,),

                        ),
                      ),
                    ),
                  )
                  ),

                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 340,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: ListView(
                children: _eventsList.map((tx){

                  return Column(
                    children: [
                      Container(

                          height:170,
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                            color:Colors.white,
                          ),
                          child: FlatButton(
                              onPressed:(){},
                              child: Center(
                                child: Column(children:[
                                  SizedBox(height:5),
                                  Container(width:300, height:50,
                                      decoration:BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        gradient: LinearGradient(colors: [Colors.deepPurple.shade200, Colors.deepPurpleAccent],),),
                                      child:Center(child: Text('Title of Event: ${tx.title}'))),
                                  SizedBox(height:10),
                                  Container(width:300, height:50,
                                      decoration:BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        gradient: LinearGradient(colors: [Colors.deepPurple.shade200, Colors.deepPurpleAccent],),),
                                      child: Center(
                                        child:Text('Presented By: ${tx.person}'),
                                      )

                                  ),
                                  SizedBox(height:20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children:[
                                      Icon(Icons.location_on),
                                      Text('${tx.location} '),
                                      SizedBox(width:30),
                                      Icon(Icons.access_time_outlined),
                                      Text('${tx.time}'),
                                      SizedBox(width:30),
                                      Icon(Icons.calendar_today),
                                      Text('${tx.date}')

                                    ],
                                  ),


                                ],),
                              )
                          )
                      ),
                      SizedBox(height:35),
                    ],

                  );
                }).toList(),
              )
            ),
            SizedBox(height:15),
            Center(
                child: Container(
                width:200,
                height:70,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color:Colors.purple[900],
                ),
                child: FlatButton(
                  onPressed:(){
                      showModalBottomSheet<void>(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                                      return Container(
                                  width: double.infinity,
                                   height: double.infinity,
                                            color: Colors.red,
                                            child:ListView(
                                                children:[
                                                NewEvent(_addNewEvent),
                                                  ElevatedButton(
                                                    child: const Text('Back Events'),
                                                    onPressed: () => Navigator.pop(context),
                                                  ),
                                                  SizedBox(
                                                    height: 800,
                                                  ),
                          ],
                      ),

                    );}
    );
                  },
                  child: Row(
                    children: [
                          Icon(Icons.add_box_outlined,color:Colors.white),
                          SizedBox(width:20),
                          Text('Add Event',style:TextStyle(color:Colors.white)),
                    ],
                  ),)
            )),
          ],
        )
      )
    );
  }
}

