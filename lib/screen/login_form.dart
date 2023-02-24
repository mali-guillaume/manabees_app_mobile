import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manabees_app_mobile/models/User_model.dart';
import 'package:manabees_app_mobile/routes/routes.dart';
import 'package:manabees_app_mobile/services/user_service.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final mailController = TextEditingController();
  final mdpController = TextEditingController();
  Future<User>? _futureUser;
  Future<int>? _futureint;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Login to your account",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      inputFile(label: "Email", controller: mailController),
                      inputFile(
                          label: "Password",
                          obscureText: true,
                          controller: mdpController),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 30, left: 3),
                    child: MaterialButton(
                      highlightColor: Colors.amber,
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        String mail = mailController.text;
                        String mdp = mdpController.text;

                        _futureint = httpService().verifyUser(mail);

                        _futureint!.then((value) {
                          _futureUser =
                              httpService().verifyUserandPassword(mail, mdp);
                          _futureUser!.then((value) {
                            Navigator.pushNamed(context, kCalendar);
                          }).catchError((onError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(onError.toString())));
                          });
                        }).catchError((onError) {
                          print("votre utilisateur n'existe pas");
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(onError.toString())));
                        });
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
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("vous n'avez pas de compte"),
                    Text(
                      "Sign up",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    )
                  ],
                ),
                /*Container(
                  padding: EdgeInsets.only(top: 100),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage())
                  ),
                )*/
              ],
            ))
          ],
        ),
      ),
    );
  }
}

Widget inputFile({
  label,
  obscureText = false,
  controller,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.grey,
            )),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      )
    ],
  );
}
