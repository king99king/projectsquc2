import 'dart:convert';

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
  //========================================
  final placeE=TextEditingController();

  final timeE=TextEditingController();

  final DateE=TextEditingController();

  void submitTx(){
    final entertedName=courseName.text;
    final entertedCode=courseCode.text;
    final entertedUrl=courseUrl.text;
    //===================================
    final entertedPlace=placeE.text;
    final entertedTime=timeE.text;
    final entertedDate=DateE.text;

    widget.addBk(
      entertedName,
      entertedCode,
      entertedUrl,
      //=================================
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
            TextField(
              decoration: InputDecoration(
                  labelText: 'Place of Event'
              ),
              keyboardType: TextInputType.text,
              controller: courseUrl,
              //onSubmitted: (_) =>submitTx(),
            ),
            FlatButton(
              onPressed: submitTx,
              child: Text('Add Course'),
              color:Colors.red, ),
          ],
        ),
      ),

    );
  }
}
