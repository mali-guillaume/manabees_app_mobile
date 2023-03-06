import 'dart:convert';

List<Ruche> rucheFromJson(String str) =>
    List<Ruche>.from(json.decode(str).map((x) => Ruche.fromJson(x)));

class Ruche {
  final int? hiveid;
  final String nom;
  final String localisation;
  final String deployment;
  final int idRucher;
  final int idProprietaire;

  const Ruche(
      {required this.nom,
      required this.localisation,
      required this.deployment,
      this.hiveid,
      required this.idProprietaire,
      required this.idRucher});

  factory Ruche.fromJson(Map<String, dynamic> json) => Ruche(
      hiveid: json['hiveid'],
      nom: json['nom'],
      localisation: json['localisation'],
      deployment: json['deployment'],
      idRucher: json['idRucher'],
      idProprietaire: json['idProprietaire']);


  Map<String, dynamic> toJson() => {
        'hiveid': hiveid,
        'nom': nom,
        'localisation': localisation,
        'deplyment': deployment,
        'idRucher': idRucher,
        'idProprietaire': idProprietaire,
      };

  @override
  String toString() {
    // TODO: implement toString
    return 'id: $hiveid, nom: $nom localisation: $localisation';
  }
}
