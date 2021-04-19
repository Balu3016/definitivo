class Emergencia {
  int id;
  String nombreinstitucion;
  String zonainstitucion;
  String telefonoinstitucion;
  String img;



  Emergencia(
    { 
    this.id,
    this.nombreinstitucion,
    this.zonainstitucion,
    this.telefonoinstitucion,
    this.img,

    });

  factory Emergencia.fromJson(Map<String, dynamic>json){
    return Emergencia(
      id: json['id'],
      nombreinstitucion: json['nombreinstitucion'],
      zonainstitucion: json['zonainstitucion'],
      telefonoinstitucion: json['telefonoinstitucion'],
      img: json['img'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombreinstitucion': nombreinstitucion,
      'zonainstitucion': zonainstitucion,
      'telefonoinstitucion': telefonoinstitucion,
      'img': img,
    };
    
  }
  

}