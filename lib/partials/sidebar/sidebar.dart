

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:manabees_app_mobile/routes/routes.dart';
import 'package:manabees_app_mobile/style/constants.dart';

class SidebarScreen extends StatefulWidget {
  const SidebarScreen({Key? key}) : super(key: key);

  @override
  _SidebarScreenState createState() => _SidebarScreenState();
}

/// C'est un widget avec état qui affiche une barre latérale avec un bouton de
/// déconnexion
class _SidebarScreenState extends State<SidebarScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(34)),
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 34),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,


            children: [
              TextButton(onPressed: (){Navigator.pushNamed(context, kHOMERoute);}, child: Text("tableau de bord",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.grey),)),

              TextButton(onPressed: (){Navigator.pushNamed(context, kHOMERoute);}, child: Text("Ruchers",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.grey),)),
              TextButton(onPressed: (){Navigator.pushNamed(context, kRucheRoute);}, child: Text("Ruches",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.grey),)),
              const Spacer(),
              Row(
                children: [
                  const Icon(
                    Icons.logout,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 5),
                  TextButton(
                    onPressed: () {
                      FlutterSession().set("token",'');
                      Navigator.pushNamed(context, kHomeRoute);
                    },
                    child: const Text(
                      "Je me déconnecte!",
                      style: fontStyleLegend,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}