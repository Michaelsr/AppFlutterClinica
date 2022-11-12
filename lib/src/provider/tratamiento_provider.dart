import 'dart:convert';

import 'package:clinica/src/models/tratamiento_model.dart';
import 'package:http/http.dart' as http;

class TratamientoProvider {
  final String _url =
      'https://flutter-varios-a4f88-default-rtdb.firebaseio.com';

  Future<bool> crearTratamiento(TratamientoModel tratamiento) async {
    final url = '$_url/tratamientos.json';
    final resp =
        await http.post(url, body: tratamientoModelToJson(tratamiento));
    final decodeData = json.decode(resp.body);

    print(decodeData);
    return true;
  }

  Future<bool> editarTratamiento(TratamientoModel tratamiento) async {
    final url = '$_url/tratamientos/${tratamiento.id}.json';
    final resp = await http.put(url, body: tratamientoModelToJson(tratamiento));
    final decodeData = json.decode(resp.body);

    print(decodeData);
    return true;
  }

  Future<List<TratamientoModel>> cargarTratamiento() async {
    final url = '$_url/tratamientos.json';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<TratamientoModel> tratamiento = new List();

    if (decodedData == null) return [];
    decodedData.forEach((id, prod) {
      final proTemp = TratamientoModel.fromJson(prod);
      proTemp.id = id;
      tratamiento.add(proTemp);
    });

    // print(productos);
    return tratamiento;
  }

  Future<int> borrarTratamiento(String id) async {
    final url = '$_url/tratamientos/$id.json';
    final resp = await http.delete(url);

    print(resp.body);

    return 1;
  }
}
