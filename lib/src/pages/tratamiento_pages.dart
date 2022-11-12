import 'package:clinica/src/models/tratamiento_model.dart';
import 'package:clinica/src/provider/tratamiento_provider.dart';
import 'package:clinica/src/utils/utils.dart' as utils;
import 'package:flutter/material.dart';

class TrataMientoPages extends StatefulWidget {
  @override
  _TrataMientoPagesState createState() => _TrataMientoPagesState();
}

class _TrataMientoPagesState extends State<TrataMientoPages> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final tratamientoProvider = new TratamientoProvider();
  TratamientoModel tratamiento = new TratamientoModel();
  bool _guardando = false;

  String _optSelect = 'Rayos X';
  List<String> _tipos = [
    'Eco. Abdomen Superior',
    'Eco. Abdomen Inferior',
    'Eco. obstretica',
    'Eco. Cadera',
    'Rayos X',
    'Det. Malformacion Congenita',
    'Urografia Escretoria',
    'Istero Salpinografia',
    'Lec. Tomografia Espiral',
    'Cirugia Intervencionismo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tratamientos"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _creartratamiento(),
                _crearPeso(),
                _crearEdad(),
                _crearDni(),
                _crearTelefono(),
                _crearTipo(),
                _crearDetalle(),
                _crearFechaInicio(),
                _crearFechaFinal(),
                _crearNumTratamiento(),
                Divider(),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _creartratamiento() {
    return TextFormField(
      initialValue: tratamiento.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre cliente',
      ),
      onSaved: (value) => tratamiento.nombre = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese detalle';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearPeso() {
    return TextFormField(
      // initialValue: tratamiento.peso.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Peso',
      ),
      onSaved: (value) => tratamiento.peso = double.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Solo numeros';
        }
      },
    );
  }

  Widget _crearEdad() {
    return TextFormField(
      // initialValue: tratamiento.edad.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Edad',
      ),
      onSaved: (value) => tratamiento.edad = int.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Solo numeros';
        }
      },
    );
  }

  Widget _crearDni() {
    return TextFormField(
      // initialValue: tratamiento.dni.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Dni',
      ),
      onSaved: (value) => tratamiento.dni = int.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Solo numeros';
        }
      },
    );
  }

  Widget _crearTelefono() {
    return TextFormField(
      // initialValue: tratamiento.telefono.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Numero De Celular',
      ),
      onSaved: (value) => tratamiento.telefono = int.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Solo numeros';
        }
      },
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _tipos.forEach((f) {
      lista.add(DropdownMenuItem(
        child: Text(f),
        value: f,
      ));
    });
    return lista;
  }

  Widget _crearTipo() {
    return DropdownButtonFormField(
      value: _optSelect,
      items: getOpcionesDropdown(),
      onChanged: (opt) {
        setState(() {
          _optSelect = opt;
        });
      },
      onSaved: (value) => tratamiento.tipo = value,
    );
  }

  Widget _crearDetalle() {
    return TextFormField(
      // initialValue: tratamiento.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Detalle',
      ),
      onSaved: (value) => tratamiento.detalle = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese Detalle';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearFechaInicio() {
    return TextFormField(
      // initialValue: tratamiento.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Fecha Inicio',
      ),
      onSaved: (value) => tratamiento.fechaInicio = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese Fecha';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearFechaFinal() {
    return TextFormField(
      // initialValue: tratamiento.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Fecha Final',
      ),
      onSaved: (value) => tratamiento.fechaFinal = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese Fecha';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearNumTratamiento() {
    return TextFormField(
      // initialValue: tratamiento.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Detalle numero de Tratamiento',
      ),
      onSaved: (value) => tratamiento.numTratamiento = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese Numero De Tratamiento';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      label: Text("Guardar"),
      icon: Icon(Icons.save),
      textColor: Colors.white,
      color: Colors.deepPurple,
      onPressed: (_guardando) ? null : _sumit,
    );
  }

  void _sumit() {
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();

    setState(() {
      _guardando = true;
    });

    if (tratamiento.id == null) {
      tratamientoProvider.crearTratamiento(tratamiento);
    } else {
      tratamientoProvider.editarTratamiento(tratamiento);
    }

    Navigator.pop(context);
  }
}
