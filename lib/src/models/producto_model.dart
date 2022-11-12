import 'dart:convert';

ProductoModel productoModelFromJson(String str) =>
    ProductoModel.fromJson(json.decode(str));
String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
  String id;
  String nombre;
  String tipo;
  String detalle;
  double valor;
  String lugar;

  ProductoModel({
    this.id,
    this.nombre = '',
    this.tipo = '',
    this.detalle = '',
    this.valor = 0.0,
    this.lugar = '',
  });

  factory ProductoModel.fromJson(Map<String, dynamic> json) =>
      new ProductoModel(
        id: json["id"],
        nombre: json["nombre"],
        tipo: json["tipo"],
        detalle: json["titulo"],
        valor: json["valor"],
        lugar: json["lugar"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "nombre": nombre,
        "tipo": tipo,
        "detalle": detalle,
        "valor": valor,
        "lugar": lugar,
      };
}
