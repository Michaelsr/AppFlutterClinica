import 'dart:convert';

import 'package:clinica/src/models/producto_model.dart';
import 'package:http/http.dart' as http;

class ProductosProvider {
  final String _url =
      'https://flutter-varios-a4f88-default-rtdb.firebaseio.com';

  Future<bool> crearProducto(ProductoModel producto) async {
    final url = '$_url/productos.json';
    final resp = await http.post(url, body: productoModelToJson(producto));
    final decodeData = json.decode(resp.body);

    print(decodeData);
    return true;
  }

  Future<bool> editarProducto(ProductoModel producto) async {
    final url = '$_url/productos/${producto.id}.json';
    final resp = await http.put(url, body: productoModelToJson(producto));
    final decodeData = json.decode(resp.body);

    print(decodeData);
    return true;
  }

  Future<List<ProductoModel>> cargarProductos() async {
    final url = '$_url/productos.json';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductoModel> productos = new List();

    if (decodedData == null) return [];
    decodedData.forEach((id, prod) {
      final proTemp = ProductoModel.fromJson(prod);
      proTemp.id = id;
      productos.add(proTemp);
    });

    // print(productos);
    return productos;
  }

  Future<int> borrarProducto(String id) async {
    final url = '$_url/productos/$id.json';
    final resp = await http.delete(url);

    print(resp.body);

    return 1;
  }
}
