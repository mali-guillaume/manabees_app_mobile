

import 'package:flutter/material.dart';
import 'package:manabees_app_mobile/routes/routes.dart';
import 'package:manabees_app_mobile/services/MySqlDatabase_helper.dart';
import 'package:manabees_app_mobile/utilities/notifications.dart';

import '../models/User_model.dart';

//FirebaseAuth.instance.currentUser

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> with TickerProviderStateMixin {
  String mot = "";
  final myController = TextEditingController();
  final myControllerPrenom = TextEditingController();
  final myControllerMail = TextEditingController();
  final myControllerMdp = TextEditingController();




  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SafeArea(
                child: Center(
      child: Column(
        children: <Widget>[
          Text(myController.text),
          TextField(
            controller: myController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
          TextField(
            controller: myControllerPrenom,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
          TextField(
            controller: myControllerMail,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
          TextField(
            controller: myControllerMdp,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
          TextButton(
              onPressed: () async{
                final User user = User( nom: myController.text, prenom: myControllerPrenom.text, mail: myControllerMail.text, mdp: myControllerMdp.text);

                  MySqlDatabase_helper().addUser(user);
                  Navigator.pushNamed(context, kCalendar);



                /*showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // Retrieve the text the that user has entered by using the
                      // TextEditingController.
                      content: Text(myController.text),

                    );
                  },
                );*/

                //SendErrorNotification(context, myController.text);
                //SendDataNotification(context, myController.text);

                Text('vous devez mettre des information');

                //Navigator.pushNamed(context, kCalendar);

              },
              child: Text('Ajouter Texte'))
        ],
      ),
    ))));
  }
}

