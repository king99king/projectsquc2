import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modulus/class.dart';
class NewInest extends StatefulWidget {
  final Function addIn;
  NewInest(this.addIn);

  @override
  State<NewInest> createState() => _NewInestState();
}

class _NewInestState extends State<NewInest> {
  //================================================
  final courseName=TextEditingController();

  final courseCode =TextEditingController();

  void submitIn(BuildContext context){
    final entertedName=courseName.text;
    final entertedCode=courseCode.text;
    //===================================
    widget.addIn(
      entertedName,
      entertedCode,
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
                  labelText: 'Course Name'
              ),
              keyboardType: TextInputType.text,
              controller: courseName,
            ),
            //=====================person
            TextField(
              decoration: InputDecoration(
                  labelText: 'course Code'
              ),
              keyboardType: TextInputType.text,
              controller: courseCode,
              //onSubmitted: (_) =>submitTx(),
            ),
            //======================place

            FlatButton(
                onPressed:(){
                        if(courseCode.text!="" && courseName.text!=""){
                        submitIn(context);
                        showAlertDialog1(context);
                        }else{
                        showAlertDialog2(context);
                        }


    },
              child: Text('Add Course'),
              color:Colors.red, ),
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
    content: Text("Pleas fill all fileds "),
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