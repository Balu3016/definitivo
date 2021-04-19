class Usuario {
  int id;
  String nombre;
  String primerapellido;
  String segundoapellido;
  String perfil;
  String telefono;
  String sexo;

  Usuario({ 
       this.id,
       this.nombre,
       this.primerapellido,
       this.segundoapellido,
       this.perfil,
       this.telefono,
       this.sexo,
        
        });

        Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': nombre,
      'primer_apellido': primerapellido,
      'segundo_apellido': segundoapellido,
      'perfil': perfil,
      // 'telefono': telefono,
      'telefono': telefono,
      'sexo': sexo
    };
  }

  factory Usuario.fromJson(Map<String, dynamic>json){
    return Usuario(
      id: json['id'],
      nombre: json['name'],
      primerapellido: json['primer_apellido'],
      segundoapellido: json['segundo_apellido'],
      perfil: json['perfil'],
      telefono: json['telefono'],
      sexo: json['sexo'],
    );
  }
}