class User {
  final int? IdUser;
  final String nom;
  final String prenom;
  final String mail;
  final String mdp;

  const User({
    required this.nom,
    required this.prenom,
    this.IdUser,
    required this.mail,
    required this.mdp,
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      IdUser: json['IdUser'],
      nom: json['nom'],
      prenom: json['prenom'],
      mail: json['mail'],
      mdp: json['mdp'],
    );
  }



  Map<String, dynamic> toJson() => {
        'IdUser': IdUser,
        'nom': nom,
        'prenom': prenom,
        'mail': mail,
        'mdp': mdp
      };



  @override
  String toString() {
    // TODO: implement toString
    return 'id: $IdUser, nom: $nom prenom: $prenom';
  }
}
