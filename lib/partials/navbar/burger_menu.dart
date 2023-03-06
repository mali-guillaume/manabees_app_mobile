import 'package:flutter/material.dart';
import 'package:manabees_app_mobile/main.dart';
import 'package:manabees_app_mobile/routes/routes.dart';
import 'package:manabees_app_mobile/screen/Home.dart';
import 'package:manabees_app_mobile/style/constants.dart';

import '../../models/ruche_model.dart';
import '../../services/user_service.dart';

@immutable
class BurgerMenu extends StatefulWidget {
  const BurgerMenu({Key? key}) : super(key: key);

  @override
  _BurgerMenuState createState() => _BurgerMenuState();
}

class _BurgerMenuState extends State<BurgerMenu> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, kRucheRoute);
        Scaffold.of(context).openDrawer();
      },
      child: Container(

          width: largeurEcran / 3,
          height: hauteurEcran / 3,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: kBorderRadiusItem,
            boxShadow: kBoxShadowItem,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              Text(
                "Ruche",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[700], fontSize: largeurEcran / 15),
              ),
              /*Text(
                "5",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[700], fontSize: largeurEcran / 15),
              ),*/
              const Spacer(),
              Expanded(
                  child: FutureBuilder<List<Ruche>>(
                    future: httpService().getRuches(),
                    builder: (context, snapshot) {
                      print("snapshot");
                      print(snapshot.data);
                      if (snapshot.hasData) {
                        print(snapshot.data!.length.toString());
                        return Text(snapshot.data!.length.toString(), style: TextStyle(
                            color: Colors.grey[700], fontSize: largeurEcran / 15), );




                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  ))



            ],
          )),
    );
  }
}
