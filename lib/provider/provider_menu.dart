import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _ProviderMenu {
  List<dynamic> opciones = [];
  _ProviderMenu(){
    //loadData();
  }

  Future <List<dynamic>> cargarData() async{

    final resp = await rootBundle.loadString('/data.json');
    Map dataMap = json.decode(resp);
    print(dataMap['rutas']);
    opciones = dataMap['rutas'];

    return opciones;
  }
}

final menuProvider = new _ProviderMenu();