import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projectsquc/Util/AppData.dart';
import 'package:projectsquc/homePage.dart';
import 'package:projectsquc/modulus/class.dart';
import 'package:projectsquc/thirdScreens/ListClass.dart';
import 'package:projectsquc/thirdScreens/youtube/NewUrl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../AddPages/NewYoutube.dart';


class Listyoutube extends StatefulWidget {
  const Listyoutube({Key? key,required this.new1}) : super(key: key);

  final course_class new1;
  @override
  _ListyoutubeState createState() => _ListyoutubeState();
}

class _ListyoutubeState extends State<Listyoutube> {

  static List<courseVideos> _YoutubeList = [
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
    final newYt= courseVideos(
      videoTitle: course,
      videoUrl: code,
      courseCode:widget.new1.courseCode,

    );
    setState(() {
      _YoutubeList.add(newYt);
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor:Colors.purple.shade900,
            ),
            body: Container(
                color: Colors.grey[300],
                child: Column(
                  children:[

                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: double.infinity,
                      height: 600,
                      child: ListView(children:_YoutubeList.where((element) => element.courseCode == widget.new1.courseCode).map((tx){
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
                                    onPressed:()
                                      async {
                                        final url='${tx.videoUrl}';
                                        if(
                                        await canLaunch(url)){
                                      await launch(url);
                                      }else if( await canLaunch(url)){
                                      await launch(url,
                                      forceSafariVC: false);
                                      };
                                    },

                                    child: Center(
                                      child: Column(
                                        children:[
                                        SizedBox(height:5),
                                        Container(
                                            width:300, height:50,
                                            decoration:BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft:Radius.circular(30),
                                                topRight :Radius.circular(30),
                                              ),
                                              gradient: LinearGradient(colors: [Colors.deepPurple.shade200, Colors.deepPurpleAccent],),),
                                            child:Center(child: Text('video title: ${tx.videoTitle}'))),
                                        SizedBox(height:10),
                                        Container(width:300, height:50,
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
                                            minWidth: 300,
                                            onPressed: () {
                                              setState(() {
                                                _YoutubeList.remove(tx);
                                              });
                                            },
                                            child: Text('Delete video'),

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
                  /*  ListView.builder(
                      itemCount: _YoutubeList.length,
                      itemBuilder: (context, index) {
                        return Card(youtubeVideo: _YoutubeList[index]);

                    },),*/
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
                                          NewUrl(_addNewCYt),
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
                              Text('Add Video',style:TextStyle(color:Colors.white),textAlign: TextAlign.justify,),
                            ],
                          ),)


                    )),
                  ],
                )
            ),
          ),
        )
    );
  }
}