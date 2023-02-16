import 'package:manabees_app_mobile/models/User_model.dart';
import 'package:mysql1/mysql1.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:http/http.dart' as http;

class MySqlDatabase_helper{
  String host =  "mammouth-nas001.manakeen.local";
  int port = 3306;
  String user= "manabees_test";
  String pwd = "&Manabees1";
  String bd = "manabees_test";




  Future<MySqlConnection> getDBMysql() async{
    final conn = await MySqlConnection.connect(
      ConnectionSettings(host: host, port: port, user: user, password: pwd, db: bd)
    );
    return conn;
  }


  Future<List<dynamic>> getAllUser() async {
    final db = await getDBMysql();
    var result = await db.query("select * from User");
    return result.toList();
  }

  Future<List<dynamic>> VerifyUserandMdp(String mdp, String User) async {
    final db = await getDBMysql();
    var result = await db.query("select * from User where mdp like '$mdp' and user like '$User';");
    return result.toList();
  }

  Future<int> addUser(User user) async {
    final db = await getDBMysql();
    int vide = 1;
    var result = await db.query("insert into User(IdUser, nom, prenom, mail, mdp) values ( null , ? , ? , ? , ?)",[user.nom, user.prenom, user.mail, user.mdp]);
    if(result.isEmpty){
      vide =0;
    }
    return vide;
  }
}