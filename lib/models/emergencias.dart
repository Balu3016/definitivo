class Emergencias {
  int id;
  String name;
  String phone;
  String zona;

  Emergencias({this.id, this.name, this.phone, this.zona});

  factory Emergencias.fromJson(Map<String, dynamic> json) {
    return Emergencias(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      zona: json['zona'],
    );
  }
}
