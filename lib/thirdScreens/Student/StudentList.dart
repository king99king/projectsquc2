import 'package:flutter/material.dart';
import 'package:projectsquc/Storage_Fire_base.dart';
import 'package:projectsquc/modulus/class.dart';
import 'package:projectsquc/thirdScreens/ListClass.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../../AddPages/NewYoutube.dart';
import 'NewVideoSt.dart';


class StudentList extends StatefulWidget {
  const StudentList({Key? key,required this.new1S}) : super(key: key);

  final course_class new1S;
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {

  static List<courseVideosSt> _StudentListv = [
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

  void _addNewCYt(String course, String namest){
    final newSt= courseVideosSt(
      videoTitle: course,
      name: namest,
      courseCode:widget.new1S.courseCode,

    );
    setState(() {
      _StudentListv.add(newSt);
    });
  }
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    final Storage storage =Storage();
    super.initState();
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();
    // Use the controller to loop the video.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
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
                      child: ListView(children:_StudentListv.where((element) => element.courseCode == widget.new1S.courseCode).map((tx){
                        return Column(
                          children:[
                            Container(
                                height:230,
                                decoration:BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  color:Colors.white,
                                ),
                                child: FlatButton(
                                    onPressed:()
                                    {
                                      _showMyDialog(context);
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
                                          SizedBox(height:10),
                                          Container(width:300, height:50,
                                              decoration:BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                gradient: LinearGradient(colors: [Colors.deepPurple.shade200, Colors.deepPurpleAccent],),),
                                              child:Center(child: Text('Student: ${tx.name}'))),
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
                                                _StudentListv.remove(tx);
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
                                          NewVideo(_addNewCYt),
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
                              Text('Add video',style:TextStyle(color:Colors.white)),
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
  Future<void> _showMyDialog(context) async {
    final Storage storage =Storage();
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,// user must tap button!
      builder: (BuildContext context) {
        return Scaffold(

          body:ListView(
            children: [

          FutureBuilder(
            future:_initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the VideoPlayerController has finished initialization, use
                // the data it provides to limit the aspect ratio of the video.
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  // Use the VideoPlayer widget to display the video.
                  child: Container(
                    height: 2343,
                    width: 232,
                    child: VideoPlayer(_controller)
                  ),
                );
              } else {
                // If the VideoPlayerController is still initializing, show a
                // loading spinner.
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          FloatingActionButton(
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Icon(
                _controller.value.isPlaying
                    ? Icons.pause
                    : Icons.play_arrow,
              ),
            )
            ],
          ));

      },
    );
  }
}

























