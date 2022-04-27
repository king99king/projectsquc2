import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modulus/class.dart';
class NewUrl extends StatefulWidget {
  final Function addYt;
  NewUrl(this.addYt);

  @override
  State<NewUrl> createState() => _NewUrlState();
}

class _NewUrlState extends State<NewUrl> {
  //================================================
  final courseName=TextEditingController();

  final VideoUrl =TextEditingController();

  void submitSt(BuildContext context){
    final entertedName=courseName.text;
    final entertedUrl=VideoUrl.text;
    //===================================
    widget.addYt(
      entertedName,
      entertedUrl,
      //=================================
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  labelText: 'video url'
              ),
              keyboardType: TextInputType.text,
              controller: VideoUrl,
              //onSubmitted: (_) =>submitTx(),
            ),
            //======================place

            FlatButton(
              onPressed:(){
                if(VideoUrl.text!="" && courseName.text!=""){
                  submitSt(context);
                  showAlertDialog1(context);
                }else{
                  showAlertDialog2(context);
                }


              },
              child: Text('Add Video',style: TextStyle(
                color: Colors.white,
              ),),
              color:Colors.deepPurple, ),
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