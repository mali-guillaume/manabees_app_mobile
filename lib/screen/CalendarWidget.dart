import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manabees_app_mobile/models/note_model.dart';
import 'package:manabees_app_mobile/routes/routes.dart';
import 'package:manabees_app_mobile/services/database_helper.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calendarScreen.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _focusedDay = DateTime.now();
  CalendarFormat format = CalendarFormat.month;
  late DateTime date;

  void _onDaySelected(_selectedDay, DateTime focusedDay) {
    setState(() {
      selectedDate = _selectedDay;
      _focusedDay = focusedDay;


      //Navigator.pushNamed(context, kHomeRoute);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedDate = _focusedDay;

    //loadPreviousEvents();

  }

  loadPreviousEvents() {
    mySelectedEvents = {
      "2023-02-07": [
        {"eventDescrp": "11", "eventTitle": "111"},
        {"eventDescrp": "22", "eventTitle": "22"},
      ],
      "2023-02-08": [
        {"eventDescrp": "11", "eventTitle": "111"},
        {"eventDescrp": "22", "eventTitle": "23"},
        {"eventDescrp": "11", "eventTitle": "111"},
        {"eventDescrp": "22", "eventTitle": "23"},
        {"eventDescrp": "11", "eventTitle": "111"},
        {"eventDescrp": "22", "eventTitle": "23"},
        {"eventDescrp": "11", "eventTitle": "111"},
        {"eventDescrp": "22", "eventTitle": "23"},
        {"eventDescrp": "11", "eventTitle": "111"},
        {"eventDescrp": "22", "eventTitle": "23"},
        {"eventDescrp": "11", "eventTitle": "111"},
        {"eventDescrp": "22", "eventTitle": "23"},
        {"eventDescrp": "11", "eventTitle": "111"},
        {"eventDescrp": "22", "eventTitle": "23"},
      ],
    };
  }







  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: <Widget>[
        Text("Selected Day =" + _focusedDay.toString().split(" ")[0]),
        TableCalendar(
          eventLoader: _listOfDayEvents,
            locale: 'fr_FR',
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2000, 1, 1),
            lastDay: DateTime.utc(2100, 3, 14),
            availableGestures: AvailableGestures.all,
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            onDaySelected: _onDaySelected,
            selectedDayPredicate: (day) {
              /*if(selectedDate > 1)
                {
                  return isSame()
                }*/
              return isSameDay(selectedDate, day);
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            }),
        Expanded(
            child: SingleChildScrollView(
                child:
                    /*
              ..._listOfDayEvents(selectedDate).map((myEvents) => ListTile(
                    isThreeLine: true,
                    leading: const Icon(
                      Icons.done,
                      color: Colors.teal,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text('Event title: ${myEvents['eventTitle']}'),
                     ),
                    subtitle: Text('Description: ${myEvents['eventDescrp']}'),
                  ))*/

                    // Changer CA

                    FutureBuilder<List<Note>?>(
                        future: DatabaseHelper.getAllNotesofDay(selectedDate),
                        builder:
                            (context, AsyncSnapshot<List<Note>?> snapshot) {
                              String dateForm= DateFormat('yyyy-MM-dd').format(selectedDate);
                          print('date $dateForm');
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else if (snapshot.hasData) {
                            if (snapshot.data != null) {

                              return Container(
                                  height: 500,
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        child: ListView.builder(
                                            itemCount: snapshot.data?.length,
                                            itemBuilder: (context, index) =>
                                                Text(snapshot.data![index]
                                                    .toString())),
                                      )
                                    ],
                                  ));
                            } else {
                              return Text('loading');
                            }
                          } else {
                            return Text('Loading');
                          }
                        })



                /*..._listOfDayEvents(selectedDate)
                  .map((e) => FutureBuilder<List<Note>?>(
                      future: DatabaseHelper.getAllNotes(),
                      builder: (context, AsyncSnapshot<List<Note>?> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        else if (snapshot.hasError){
                          return Center(child: Text(snapshot.error.toString()),);
                        }
                        /*else if ( snapshot.hasData){
                          if ( snapshot.data != null) {
                            return ListView.builder(itemBuilder: (context, index))
                          }

                        }*/
                        else{
                          return Text('coucou');
                        }

                      }))*/

                )),
      ],
    ));
  }

  List _listOfDayEvents(DateTime dateTime) {

    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }



  }



  /*List _listOfDayEvents(DateTime datetime){
    if(){

    }
    else{
      return [];
    }
  }*/


}

/*ListTile(
isThreeLine: true,
leading: const Icon(
Icons.done,
color: Colors.teal,
),
title: Padding(
padding: const EdgeInsets.only(bottom: 8.0),
child: Text('Event title: ${myEvents['eventTitle']}'),
),
subtitle: Text('Description: ${myEvents['eventDescrp']}'),
)))*/
