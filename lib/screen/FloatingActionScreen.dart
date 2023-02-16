import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manabees_app_mobile/services/database_helper.dart';
import 'package:path/path.dart';

import '../models/note_model.dart';
import 'calendarScreen.dart';

class FloatingActionScreen extends StatelessWidget {
  final Note? note;

  FloatingActionScreen( {Key? key, this.note}) : super(key: key);

  final titleController = TextEditingController();
  final descpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(note != null){
      titleController.text = note!.title;
      descpController.text = note!.description;

    }
    return FloatingActionButton.extended(
        onPressed: () => _showAddEventDialog(context), label: const Text('Add Event'));
  }

  _showAddEventDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New event'),
        content: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descpController,
              decoration: const InputDecoration(labelText: 'Description'),
            )
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('cancel')),
          TextButton(
              onPressed: () async {
                final title = titleController.text;
                final description = descpController.text;
                if (titleController.text.isEmpty &&
                    descpController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Required title and description'),
                    duration: Duration(seconds: 2),
                  ));
                  return;
                } else {
                  print(titleController.text);
                  print(descpController.text);
                  if (mySelectedEvents[
                          DateFormat('yyyy-MM-dd').format(selectedDate!)] !=
                      null) {
                    mySelectedEvents[
                            DateFormat('yyyy-MM-dd').format(selectedDate)]
                        ?.add({
                      "eventTitle": titleController.text,
                      "eventDescrp": descpController.text,
                    });
                  } else {
                    mySelectedEvents[
                        DateFormat('yyyy-MM-dd').format(selectedDate!)] = [
                      {
                        "eventTitle": titleController.text,
                        "eventDescrp": descpController.text,
                      }
                    ];
                  }
                  final Note model =
                  Note(title: title, description: description, date: DateFormat('yyyy-MM-dd').format(selectedDate));
                  print('date $selectedDate');
                  if(note == null){
                    await DatabaseHelper.addNote(model);
                    print('voila les $model');
                  }
                  print("New event ${json.encode(mySelectedEvents)}");
                  titleController.clear();
                  descpController.clear();
                  Navigator.pop(context);
                  return;
                }
              },
              child: const Text('ADD'))
        ],
      ),
    );
  }
}
