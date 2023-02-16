import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manabees_app_mobile/screen/CalendarWidget.dart';
import 'package:manabees_app_mobile/screen/FloatingActionScreen.dart';

import '../models/note_model.dart';

class CalendarScreen extends StatefulWidget {

  const CalendarScreen({Key? key,}) : super(key: key);


  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }







  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Bonjour sur mon App'),
      ),
      body: CalendarWidget(),
      floatingActionButton: FloatingActionScreen(),
    );
  }

}

var selectedDate;
Map<String, List> mySelectedEvents = {};
Map<String, List> mySelectedEvent = {};
Map<String, String> mySelectedEventsPuce = {};