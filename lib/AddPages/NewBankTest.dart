import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modulus/class.dart';
class NewTest extends StatefulWidget {
  final Function addBk;
  NewTest(this.addBk);

  @override
  State<NewTest> createState() => _NewTestState();
}

class _NewTestState extends State<NewTest> {
  //================================================
  final courseName=TextEditingController();

  final courseCode =TextEditingController();

  final courseUrl=TextEditingController();

  void submitTx(BuildContext context){
    final entertedName=courseName.text;
    final entertedCode=courseCode.text;
    final entertedUrl=courseUrl.text;
    //===================================


    widget.addBk(
      entertedName,
      entertedCode,
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
            //add text fild
            //=====================course
            TextField(
              decoration: InputDecoration(
                  labelText: 'Course Code '
              ),
              keyboardType: TextInputType.text,
              controller: courseName,
            ),
            //=====================person
            TextField(
              decoration: InputDecoration(
                  labelText: 'course Name'
              ),
              keyboardType: TextInputType.text,
              controller: courseCode,
              //onSubmitted: (_) =>submitTx(),
            ),
            //======================place
            TextField(
              decoration: InputDecoration(
                  labelText: 'google Drive link'
              ),
              keyboardType: TextInputType.url,
              controller: courseUrl,
              //onSubmitted: (_) =>submitTx(),
            ),
            FlatButton(
              onPressed:(){
                if(courseName.text!="" && courseCode.text!=""&& courseUrl.text!=""){
                  submitTx(context);
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
    content: Text("Pleas fill all filds "),
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