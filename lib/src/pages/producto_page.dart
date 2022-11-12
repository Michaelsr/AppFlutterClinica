import 'package:clinica/src/models/producto_model.dart';
import 'package:clinica/src/provider/productos_provider.dart';
import 'package:clinica/src/utils/utils.dart' as utils;
import 'package:flutter/material.dart';

class Productopage extends StatefulWidget {
  @override
  _ProductopageState createState() => _ProductopageState();
}

class _ProductopageState extends State<Productopage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final productoProvider = new ProductosProvider();
  ProductoModel producto = new ProductoModel();
  bool _guardando = false;
  DateTime currentDate = DateTime.now();

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

  String _optSelectLugar = 'Sicuani';
  List<String> _lugares = [
    'Puno',
    'Sicuani',
    'Juliaca',
    'Arequipa',
  ];

  @override
  Widget build(BuildContext context) {
    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;
    if (prodData != null) {
      producto = prodData;
    }
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Boletas"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _crearCliente(),
                _crearTipo(),
                _crearDetalle(),
                _crearPrecio(),
                _crearLugar(),
                Divider(),
                _crearBoton(),
                Divider(),
                Text("$currentDate")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearCliente() {
    return TextFormField(
      initialValue: producto.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre cliente',
      ),
      onSaved: (value) => producto.nombre = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre del Cliente';
        } else {
          return null;
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
      onSaved: (value) => producto.tipo = value,
    );
  }

  Widget _crearDetalle() {
    return TextFormField(
      initialValue: producto.detalle,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Detalle',
      ),
      onSaved: (value) => producto.detalle = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese detalle';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio',
      ),
      onSaved: (value) => producto.valor = double.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Solo numeros';
        }
      },
    );
  }

  List<DropdownMenuItem<String>> getOpcionesLugaresDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _lugares.forEach((f) {
      lista.add(DropdownMenuItem(
        child: Text(f),
        value: f,
      ));
    });
    return lista;
  }

  Widget _crearLugar() {
    return DropdownButtonFormField(
      value: _optSelectLugar,
      items: getOpcionesLugaresDropdown(),
      onChanged: (opt) {
        setState(() {
          _optSelectLugar = opt;
        });
      },
      onSaved: (value) => producto.lugar = value,
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

    if (producto.id == null) {
      productoProvider.crearProducto(producto);
    } else {
      productoProvider.editarProducto(producto);
    }
    // setState(() {
    //   _guardando = false;
    // });
    mostrarSnackbar('registro guardado');
    Navigator.pop(context);
  }

  void mostrarSnackbar(String mensaje) {
    final snackBar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
