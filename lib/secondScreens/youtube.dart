import 'package:flutter/material.dart';
import 'package:projectsquc/modulus/class.dart';
import 'package:projectsquc/thirdScreens/youtube/YouTubeList.dart';

import '../AddPages/NewYoutube.dart';


class youtube extends StatefulWidget {
  const youtube({Key? key}) : super(key: key);

  @override
  _youtubeState createState() => _youtubeState();
}

class _youtubeState extends State<youtube> {

  static List<course_class> _coursesList = [
    /*  course_class(
      courseName:
        'python',
        courseCode:
        'COMP2102'

    ),
    course_class(
      courseName:
        'Java',
        courseCode:
        'COMP2202'

    ),
    course_class(
      courseName:
        'Flutter',
        courseCode:
        'COMP4206'

    ),*/

  ];

  void _addNewCYt(String course, String code){
    final newYt= course_class(
      courseCode: course,
      courseName: code,

    );
    setState(() {
      _coursesList.add(newYt);
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.grey[300],
            child: Column(
              children:[
                Container(
                    width: double.infinity,
                    height: 350,
                    decoration:BoxDecoration(
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
                          icon:Icon(Icons.arrow_back),
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
                            child:Column(
                              children: [
                                Text('YouTube',style:TextStyle(
                                  fontSize:50,
                                )),
                                Text('Videos:',style:TextStyle(
                                  fontSize:50,
                                )),

                                SizedBox(height:20),

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

                                        )
                                    )
                                ),
                                SizedBox(height:20),
                                Text("Courses:", style:TextStyle(fontSize:30))

                              ],
                            )

                        ),


                      ],
                    )
                ),
                Container(
                  width: double.infinity,
                  height: 340,
                  child: ListView(children:_coursesList.map((tx){
                    return Column(
                      children:[
                        Container(
                            height:165,
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              color:Colors.white,
                            ),
                            child: FlatButton(
                                onPressed:(){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => Listyoutube(new1: tx,)));
                                },
                                child: Center(
                                  child: Column(children:[
                                    SizedBox(height:5),
                                    Container(width:double.infinity, height:50,
                                        decoration:BoxDecoration(
                                          borderRadius:  BorderRadius.only(
                                            topLeft:Radius.circular(30),
                                            topRight :Radius.circular(30),
                                          ),
                                          gradient: LinearGradient(colors: [Colors.deepPurple.shade200, Colors.deepPurpleAccent],),),
                                        child:Center(child: Text('Course name: ${tx.courseName}'))),
                                    SizedBox(height:10),
                                    Container(
                                        width:double.infinity, height:50,
                                        decoration:BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          gradient: LinearGradient(colors: [Colors.deepPurple.shade200, Colors.deepPurpleAccent],),),
                                        child:Center(child: Text('Course code: ${tx.courseCode}'))),
                                    FlatButton(
                                      color: Colors.red.shade600,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:Radius.circular(30),
                                            bottomRight:Radius.circular(30),
                                          )
                                      ),
                                      minWidth: double.infinity,
                                      onPressed: () {
                                        setState(() {
                                          _coursesList.remove(tx);
                                        });
                                      },
                                      child: Text('Delete course'),

                                    ),
                                  ],),
                                )
                            )
                        ),
                        SizedBox(height:30),
                      ],
                    );
                  }).toList(),),

                ),
                SizedBox(height:15),
                Center(child: Container(
                    width:200,
                    height:70,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color:Colors.purple[900],
                    ),
                    child: FlatButton(onPressed:(){
                      showModalBottomSheet<void>(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.purple.shade300,
                          builder: (BuildContext context) {
                            return  Dialog(
                                child:Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.purple.shade300,
                              child:ListView(
                                children:[
                                  SizedBox(height: 20,),
                                  NewYoutube(_addNewCYt),
                                  ElevatedButton(

                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.purple.shade900,
                                    ),
                                    child: const Text('Back Courses'),
                                    onPressed: () => Navigator.pop(context),
                                  ),

                                ],
                              ),
                            ));});


                    },
                      child: Row(
                        children: [
                          Icon(Icons.add_box_outlined,color:Colors.white),
                          SizedBox(width:20),
                          Text('Add Course',style:TextStyle(color:Colors.white)),
                        ],
                      ),)


                )),
              ],
            )
        )
    );
  }
}