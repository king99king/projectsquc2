import 'dart:convert';

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

  void submitTx(){
    final entertedCourse=courseE.text;
    final entertedInst=instE.text;
    final entertedPlace=placeE.text;
    final entertedTime=timeE.text;
    final entertedDate=DateE.text;

    widget.addEv(
      entertedCourse,
      entertedInst,
      entertedPlace,
      entertedTime,
      entertedDate,
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
              FlatButton(
                onPressed: submitTx,
                child: Text('Add Event'),
                color:Colors.red, ),
            ],
          ),
        ),

    );
  }
}
