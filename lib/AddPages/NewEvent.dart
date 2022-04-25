import 'dart:convert';
import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class NewEvent extends StatefulWidget {
  final Function addEv;
  NewEvent(this.addEv);

  @override
  State<NewEvent> createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  //================================================
  final courseE=TextEditingController();

  final instE =TextEditingController();

  final placeE=TextEditingController();

  final timeE=TextEditingController();

  final DateE=TextEditingController();

  final meetE=TextEditingController();

 void  submitTx(BuildContext context){
    final entertedCourse=courseE.text;
    final entertedInst=instE.text;
    final entertedPlace=placeE.text;
    final entertedTime=timeE.text;
    final entertedDate=DateE.text;
    final entertedMeet=meetE.text;

    widget.addEv(
      entertedCourse,
      entertedInst,
      entertedPlace,
      entertedTime,
      entertedDate,
      entertedMeet,
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
                    labelText: 'Course Title'
                ),
                keyboardType: TextInputType.text,
                controller: courseE,
              ),
              //=====================person
              TextField(
                decoration: InputDecoration(
                    labelText: 'Instructor  Name'
                ),
                keyboardType: TextInputType.text,
                controller: instE,
               //onSubmitted: (_) =>submitTx(),
              ),
              //======================place
              TextField(
                decoration: InputDecoration(
                    labelText: 'Place of Event'
                ),
                keyboardType: TextInputType.text,
                controller: placeE,
                //onSubmitted: (_) =>submitTx(),
              ),
              //=======================time
              TextField(
                decoration: InputDecoration(
                    labelText: 'Time of the Event'
                ),
                keyboardType: TextInputType.text,
                controller: timeE,
                //onSubmitted: (_) =>submitTx(),
              ),
              //=========================Date
              TextField(
                decoration: InputDecoration(
                    labelText: 'Date of the Event'
                ),
                keyboardType: TextInputType.text,
                controller: DateE,
               // onSubmitted: (_) =>submitTx(),//_ means null
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'If the Event online add link of the meet. ',
                    hintText: 'meet.google.com/xxx-xxxx-xxx',
                     helperText:  'meet.google.com/xxx-xxxx-xxx',
                                      ),
                keyboardType: TextInputType.text,
                controller: meetE,

                // onSubmitted: (_) =>submitTx(),//_ means null
              ),
              FlatButton(
                onPressed:(){
                  if(courseE.text!="" && timeE.text!=""&& instE.text!="" && placeE.text!="" && DateE.text!="" ){
                    submitTx(context);
                    showAlertDialog1(context);
                  }else{
                    showAlertDialog2(context);
                  }


                },


                child: Text('Add Event',style: TextStyle(
                  color: Colors.white,
                ),),
                color:Colors.purple[900], ),
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
    content: Text("Pleas fill all filds, \n 🖥 if there is no online session leave the link filed empty"),
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
