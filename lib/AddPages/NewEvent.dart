import 'dart:convert';
import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  void initState() {
    DateE.text = ""; //set the initial value of text field
    timeE.text = "";
    super.initState();
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
                readOnly: true,  //set it true, so that user will not able to edit text
                onTap: () async {
                  TimeOfDay? pickedTime =  await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  );

                  if(pickedTime != null ){
                    print(pickedTime.format(context));   //output 10:51 PM
                    DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                    //converting to DateTime so that we can further format on different pattern.
                    print(parsedTime); //output 1970-01-01 22:53:00.000
                    String formattedTime = DateFormat('HH:mm aa').format(parsedTime);
                    print(formattedTime); //output 14:59:00
                    //DateFormat() is from intl package, you can format the time on any pattern you need.

                    setState(() {
                      timeE.text = formattedTime; //set the value of text field.
                    });
                  }else{
                    print("Time is not selected");
                  }
                },


                //onSubmitted: (_) =>submitTx(),
              ),
              //=========================Date
              TextField(
                decoration: InputDecoration(
                    labelText: 'Date of the Event'
                ),
                keyboardType: TextInputType.text,
                controller: DateE,
                readOnly: true,  //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );

                  if(pickedDate != null ){
                    print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      DateE.text = formattedDate; //set output date to TextField value.
                    });
                  }else{
                    print("Date is not selected");
                  }
                },
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
