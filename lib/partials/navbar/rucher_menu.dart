import 'package:flutter/material.dart';
import 'package:manabees_app_mobile/main.dart';
import 'package:manabees_app_mobile/screen/Home.dart';
import 'package:manabees_app_mobile/style/constants.dart';

@immutable
class RucherMenu extends StatefulWidget {
  const RucherMenu({Key? key}) : super(key: key);

  @override
  _RucherMenuState createState() => _RucherMenuState();
}



class _RucherMenuState extends State<RucherMenu> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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

              Expanded(child:Icon(
                Icons.location_on_outlined,
                color: Colors.white,
                size: hauteurEcran/10,

              )),
              Text(
                "Rucher",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[700], fontSize: largeurEcran / 15),
              ),
              Text(
                "5",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[700], fontSize: largeurEcran / 15),
              ),
            ],
          )),
    );
  }
}