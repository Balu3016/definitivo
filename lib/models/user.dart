class User {
  int id;
  String name;
  String lastname;
  String phone;
  String perfil;

  User({this.id, this.name, this.lastname, this.phone, this.perfil});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      lastname: json['lastname'],
      phone: json['phone'],
      perfil: json['perfil'],
    );
  }
}
