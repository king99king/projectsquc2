import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Storage_Fire_base.dart';
class NewVideo extends StatefulWidget {
  final Function addSt;
  NewVideo(this.addSt);

  @override
  State<NewVideo> createState() => _NewVideoState();
}

class _NewVideoState extends State<NewVideo> {
  //================================================
  final courseName=TextEditingController();

  final VideoUrl =TextEditingController();


  void submitSt(BuildContext context){
    final entertedName=courseName.text;
    final entertedUrl=VideoUrl.text;
    //===================================
    widget.addSt(
      entertedName,
      entertedUrl,
      //=================================
    );
  }

  @override
  Widget build(BuildContext context) {
    final Storage storage =Storage();
    return  Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            //add text field
            //=====================course
            TextField(
              decoration: InputDecoration(
                  labelText: 'video title'
              ),
              keyboardType: TextInputType.text,
              controller: courseName,
            ),
            //=====================person
            TextField(
              decoration: InputDecoration(
                  labelText: 'student name'
              ),
              keyboardType: TextInputType.text,
              controller: VideoUrl,
              //onSubmitted: (_) =>submitTx(),
            ),
            //======================place

            Container(
              child: ElevatedButton(
                onPressed: () async{
                  final result =await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ['png','jpg','mp4']
                  );
                  if(result==null){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("No file Selected"),)
                    );
                    return null;

                  }
                  //store the path of the file from fire_base
                  final path=result.files.single.path;
                  // file name
                  final fileName= result.files.single.name;
                  // print(path);
                  // print(fileName);
                  storage.uploadFile(path!, fileName).then((value) => print('Done'));


                },

                child: Text("upload from files",style: TextStyle(color: Colors.white),),

             ),

            ),
            FlatButton(
              onPressed:(){
                if(VideoUrl.text!="" && courseName.text!=""){
                  submitSt(context);
                  showAlertDialog1(context);
                }else{
                  showAlertDialog2(context);
                }


              },
              child: Text('Add  Video',style: TextStyle(color: Colors.white),),
              color:Colors.purple.shade900, ),
          ],
        ),
      ),

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
    title: Text("Done!"),
    content: Text("The Event has been added Successfully"),
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

showAlertDialog2(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: ()=> Navigator.pop(context),

  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error!"),
    content: Text("Pleas fill all filds"),
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