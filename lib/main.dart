import 'package:clinica/src/bloc/provider.dart';
import 'package:clinica/src/pages/home_trata_pages.dart';
import 'package:clinica/src/pages/menu_pages.dart';
import 'package:clinica/src/pages/producto_page.dart';
import 'package:clinica/src/pages/tratamiento_pages.dart';
import 'package:flutter/material.dart';
import 'package:clinica/src/pages/login_pages.dart';
import 'package:clinica/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'trtamiento': (BuildContext contex) => HomeTrataMientoPages(),
          'menu': (BuildContext context) => MenuPage(),
          'producto': (BuildContext context) => Productopage(),
          'tratamientos': (BuildContext context) => TrataMientoPages(),
        },
        theme: ThemeData(primaryColor: Colors.deepPurple),
      ),
    );
  }
}
