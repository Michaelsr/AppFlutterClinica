import 'dart:convert';

TratamientoModel tratamientoModelFromJson(String str) =>
    TratamientoModel.fromJson(json.decode(str));

String tratamientoModelToJson(TratamientoModel data) =>
    json.encode(data.toJson());

class TratamientoModel {
  String id;
  String nombre;
  double peso;
  int edad;
  int dni;
  int telefono;
  String tipo;
  String detalle;
  String fechaInicio;
  String fechaFinal;
  String numTratamiento;

  TratamientoModel({
    this.id,
    this.nombre = '',
    this.peso = 0.0,
    this.edad = 00,
    this.dni = 00000000,
    this.telefono = 000000000,
    this.tipo = '',
    this.detalle = '',
    this.fechaInicio = '',
    this.fechaFinal = '',
    this.numTratamiento = '',
  });

  factory TratamientoModel.fromJson(Map<String, dynamic> json) =>
      new TratamientoModel(
        id: json["id"],
        nombre: json["nombre"],
        peso: json["peso"],
        edad: json["edad"],
        dni: json["dni"],
        telefono: json["telefono"],
        tipo: json["tipo"],
        detalle: json["detalle"],
        fechaInicio: json["fechaInicio"],
        fechaFinal: json["fechaFinal"],
        numTratamiento: json["numTratamiento"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "nombre": nombre,
        "peso": peso,
        "edad": edad,
        "dni": dni,
        "telefono": telefono,
        "tipo": tipo,
        "detalle": detalle,
        "fechaInicio": fechaInicio,
        "fechaFinal": fechaFinal,
        "numTratamiento": numTratamiento,
      };
}
