import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:intl/intl.dart';
import 'package:manabees_app_mobile/partials/sidebar/sidebar.dart';
import 'package:manabees_app_mobile/screen/CalendarWidget.dart';
import 'package:manabees_app_mobile/screen/FloatingActionScreen.dart';
import 'package:manabees_app_mobile/screen/home.dart';

import '../models/User_model.dart';
import '../models/note_model.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({
    Key? key,
  }) : super(key: key);

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
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: const Drawer(
          child: SidebarScreen(),
        ),
      ),
      appBar: AppBar(
        title: Text('Bonjour '),
      ),
      body:

          //CalendarWidget(),
      FutureBuilder(
          future: FlutterSession().get("token"),
          builder: (context, snapshot) {
            return Text(snapshot.hasData ? snapshot.data : "loading ...");
          }),

      floatingActionButton: FloatingActionScreen(),
    );
  }
}

var selectedDate;
Map<String, List> mySelectedEvents = {};
Map<String, List> mySelectedEvent = {};
Map<String, String> mySelectedEventsPuce = {};
