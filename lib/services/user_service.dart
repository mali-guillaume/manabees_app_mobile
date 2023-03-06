import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart';
import 'package:manabees_app_mobile/models/User_model.dart';
import 'package:http/http.dart' as http;
import 'package:manabees_app_mobile/models/ruche_model.dart';

class httpService {
  /// Il crée un utilisateur dans la base de données.
  ///
  /// @param user L'objet utilisateur à créer.
  ///
  /// @return Un futur<utilisateur>
  Future<User> createUser(User user) async {
    print(user.toJson());
    final response = await http.post(
      Uri.parse('http://vmlin002.manakeen.local:8080/api/User/create.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nom': user.nom,
        'prenom': user.prenom,
        'mail': user.mail,
        'mdp': user.mdp
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON

      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.

      throw Exception('Failed to create User.');
    }
  }

  Future<User> verifyUserandPassword(String mail, String mdp) async {
    final response = await http.post(
      Uri.parse(
          'http://vmlin002.manakeen.local:8080/api/User/verifypassword.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'mail': mail, 'mdp': mdp}),
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.

      throw Exception("mauvais mdp");
    }
  }

  Future<int> verifyUser(String mail) async {
    final response = await http.post(
      Uri.parse('http://vmlin002.manakeen.local:8080/api/User/verifymail.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'mail': mail}),
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      return 1;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception("utilisateur non existant");
    }
  }

  Future<List<Ruche>> getRuches() async {
    final response = await http.post(
      Uri.parse('http://vmlin002.manakeen.local:8080/api/Ruche/read.php'),

    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);


      //return (ddd as List).map((data) => new Ruche.fromJson(data)).toList();*/
      var json = response.body;
      //print(json);
      return rucheFromJson(json);




    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.

      throw Exception('Failed to create User.');
    }
  }
}
