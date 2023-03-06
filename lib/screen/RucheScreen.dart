import 'package:flutter/material.dart';
import 'package:manabees_app_mobile/partials/form/text_input.dart';
import 'package:manabees_app_mobile/partials/sidebar/sidebar.dart';
import 'package:manabees_app_mobile/services/user_service.dart';
import 'package:manabees_app_mobile/style/constants.dart';

import '../models/ruche_model.dart';
import '../partials/form/search_input.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class RucheScreen extends StatefulWidget {
  const RucheScreen({Key? key}) : super(key: key);

  @override
  State<RucheScreen> createState() => _RucheScreenState();
}

class _RucheScreenState extends State<RucheScreen> {
  String ruche = "";

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
        title: Text("coucou"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const SizedBox(
                  height: kVerticalSpacer * 2,
                ),
                SearchInput(onChanged: (value) {
                  ruche = value;
                }),
              ],
            ),
            Expanded(
                child: FutureBuilder<List<Ruche>>(
              future: httpService().getRuches(),
              builder: (context, snapshot) {
                print("snapshot");
                print(snapshot.data);
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: null,
                              child: new Container(
                                width: 500.0,
                                padding: new EdgeInsets.fromLTRB(
                                    20.0, 40.0, 20.0, 40.0),
                                color: Colors.green,
                                child: new Column(children: [
                                  new Text(snapshot.data![index].toString()),
                                ]),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      );
                    },
                  );



                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ))
          ],
        ),
      ),
    );
  }
}

