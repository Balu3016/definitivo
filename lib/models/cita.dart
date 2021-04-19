class Cita {
  int id;
  String nombrepaciente;
  String estatus;
  String telefono;
  double costo;
  String tipocita;
  String fechacita;
  String direccion;



  Cita(
    { 
    this.id,
    this.nombrepaciente,
    this.estatus,
    this.telefono,
    this.costo,
    this.tipocita,
    this.fechacita,
    this.direccion,

    });

  factory Cita.fromJson(Map<String, dynamic>json){
    return Cita(
      id: json['id'],
      nombrepaciente: json['nombrepaciente'],
      telefono: json['telefono'],
      estatus: json['estatus'],
      direccion: json['direccion'],
      costo: double.parse(json['costo']),
      tipocita: json['tipocita'],
      fechacita: json['fechacita'],
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombrepaciente': nombrepaciente,
      'estatus': estatus,
      'telefono': telefono,
      'direccion': direccion,
      'costo': costo,
      'tipocita': tipocita,
      'fechacita': fechacita,
      
    };
  }
  
}