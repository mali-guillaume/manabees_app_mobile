import 'package:flutter/material.dart';
import 'package:manabees_app_mobile/routes/router.dart';
import 'package:manabees_app_mobile/routes/routes.dart';
import 'package:manabees_app_mobile/screen/error.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: kHomeRoute,
            routes: router,
          );

        //return const ErrorScreen();
      },
    );
  }
}


