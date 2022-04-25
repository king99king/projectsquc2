

import 'package:flutter/cupertino.dart';

class events_class {
  final String title;
  final String person;
  final String location;
  final String time;
  final String date;
  final String meetUrl;
  events_class(
  {
    required this.title,
    required this.person,
    required this.location,
    required this.time,
    required this.date,
    required this.meetUrl,
  });


}

class course_class{
  final String courseName;
  final String courseCode;

   course_class({
    required this.courseName,
    required this.courseCode
  });

}
class courseBank {
  final String courseName;
  final String courseCode;
  final String courseUrl;

  courseBank( {
    required this.courseName,
    required this.courseCode,
    required this.courseUrl,
  });

}

