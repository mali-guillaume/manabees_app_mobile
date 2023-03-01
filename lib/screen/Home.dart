import 'package:flutter/material.dart';
import 'package:manabees_app_mobile/partials/navbar/nav_bar.dart';
import 'package:manabees_app_mobile/partials/sidebar/sidebar.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _indexState();
}

class _indexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    largeurEcran = MediaQuery.of(context).size.width;
    hauteurEcran = MediaQuery.of(context).size.height;
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
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey,
        title: Text("Tableau de bord"),
      ),
      body: SafeArea(child: Column(
        children: <Widget>[
          NavBar(),

        ],
      )),
    );
  }
}


var largeurEcran;
var hauteurEcran ;
