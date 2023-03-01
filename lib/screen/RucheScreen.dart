import 'package:flutter/material.dart';
import 'package:manabees_app_mobile/partials/form/text_input.dart';
import 'package:manabees_app_mobile/partials/sidebar/sidebar.dart';
import 'package:manabees_app_mobile/style/constants.dart';

import '../partials/form/search_input.dart';

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
            )
          ],
        ),
      ),
    );
  }
}
