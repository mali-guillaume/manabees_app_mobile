import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:manabees_app_mobile/screen/login_form.dart';
import 'package:manabees_app_mobile/services/user_service.dart';

import '../models/User_model.dart';
import '../routes/routes.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final mailController = TextEditingController();
  final mdpController = TextEditingController();
  final mdpconfirmController = TextEditingController();
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  Future<int>? _futureint;

  Future<User>? _futureUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create a account",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  inputFile(label: "Nom", controller: nomController),
                  inputFile(label: "prenom", controller: prenomController),
                  inputFile(label: "mail", controller: mailController),
                  inputFile(
                      label: "mdp",
                      obscureText: true,
                      controller: mdpController),
                  inputFile(
                      label: "confirm mdp ",
                      obscureText: true,
                      controller: mdpconfirmController)
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                child: MaterialButton(
                  highlightColor: Colors.amber,
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    if (mdpController.text == mdpconfirmController.text) {
                      _futureint =
                          httpService().verifyUser(mailController.text);

                      _futureint!.then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("l'utilisateur existe deja")));
                      }).catchError((onError) async {
                        User user = new User(
                            nom: nomController.text,
                            prenom: prenomController.text,
                            mail: mailController.text,
                            mdp: mdpController.text);
                        _futureUser = httpService().createUser(user);
                        await FlutterSession().set("token",user.mail);

                        Navigator.pushNamed(context, kHomeRoute);
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("le mdp ne sont pas egal")));
                    }
                  },
                  color: Colors.amberAccent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "login",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
