class Doctores {
  String name;
  String lastname;
  String phone;
  String perfil;
  String cedulas;
  String especialidades;
  String email;
  String zona;

  Doctores(
      {this.name,
      this.lastname,
      this.phone,
      this.perfil,
      this.cedulas,
      this.especialidades,
      this.email,
      this.zona});

  factory Doctores.fromJson(Map<String, dynamic> json) {
    return Doctores(
      name: json['name'],
      lastname: json['lastname'],
      phone: json['phone'],
      perfil: json['perfil'],
      cedulas: json['cedulas'],
      especialidades: json['especialidades'],
      email: json['email'],
      zona: json['zona'],
    );
  }
}
