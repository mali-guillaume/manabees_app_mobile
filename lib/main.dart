import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:manabees_app_mobile/routes/router.dart';
import 'package:manabees_app_mobile/routes/routes.dart';
import 'package:manabees_app_mobile/screen/Home.dart';
import 'package:manabees_app_mobile/screen/error.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:manabees_app_mobile/screen/home.dart';






/// `initializeDateFormatting()` est une fonction asynchrone qui renvoie un Future.
///
/// La méthode `.then()` est appelée sur le Future retourné par
/// `initializeDateFormatting()`.
///
/// La méthode `.then()` prend une fonction comme argument.
///
/// La fonction passée à `.then()` est appelée lorsque le Future renvoyé par
/// `initializeDateFormatting()` est terminé.
///
/// La fonction passée à `.then()` prend un argument, `_`, qui est la valeur
/// renvoyée par `initializeDateFormatting()`.
///
/// La fonction passée à `.then()` appelle `runApp()` avec l'argument `MyApp()`.
///
/// La fonction `runApp()` prend un Widget comme argument.
///
/// La fonction `MyApp()` renvoie un Widget.
///
/// Le Widget renvoyé par `MyApp()` est passé à
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting().then((_) => runApp(MyApp()));
}




/// Il vérifie si l'utilisateur a un jeton enregistré dans l'appareil. Si
/// l'utilisateur a un jeton, il redirigera l'utilisateur vers la page d'accueil. Si
/// l'utilisateur n'a pas de jeton, il redirigera l'utilisateur vers la page de
/// connexion.
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

      future: FlutterSession().get("token"),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

        if(snapshot.hasData){
          return MaterialApp(

            debugShowCheckedModeBanner: false,

            initialRoute:snapshot.data != '' ? kHOMERoute : kHomeRoute,
            routes: router,
          );
        }
        if(snapshot.hasError){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute:kHomeRoute,
            routes: router,
          );
        }
        else{
          return CircularProgressIndicator();
        }
      },
    );
  }
}
