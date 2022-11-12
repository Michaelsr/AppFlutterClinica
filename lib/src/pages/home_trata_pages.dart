import 'package:clinica/src/models/tratamiento_model.dart';
import 'package:clinica/src/provider/tratamiento_provider.dart';
import 'package:flutter/material.dart';

class HomeTrataMientoPages extends StatelessWidget {
  final tratamientoProvider = new TratamientoProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("lista Tratamientos"),
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: tratamientoProvider.cargarTratamiento(),
      builder: (BuildContext context,
          AsyncSnapshot<List<TratamientoModel>> snapshot) {
        if (snapshot.hasData) {
          final tratamiento = snapshot.data;

          return ListView.builder(
            itemCount: tratamiento.length,
            itemBuilder: (context, i) => _crearItem(context, tratamiento[i]),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, TratamientoModel tratamiento) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direccion) {
        tratamientoProvider.borrarTratamiento(tratamiento.id);
      },
      child: ListTile(
        title: Text('${tratamiento.nombre} - ${tratamiento.tipo}'),
        subtitle: Text('${tratamiento.telefono} - ${tratamiento.fechaInicio}'),
        onTap: () =>
            Navigator.pushNamed(context, 'producto', arguments: tratamiento),
      ),
    );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'tratamientos'),
    );
  }
}
