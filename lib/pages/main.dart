import 'package:flutter/material.dart';
import 'package:flutter_app_navigation/pages/avatar_page.dart';
import 'package:flutter_app_navigation/provider/provider_menu.dart';
import 'package:flutter_app_navigation/utils/icono_flutter.dart';
import 'alert_page.dart';
import 'cards_page.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joshua Landa',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Proyecto Json"),
      ),

      body: _lista(context),
    );
  }

  Widget _lista(BuildContext context){
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right_outlined),
        onTap: () {
          if(opt['ruta'] == 'alert'){
            final route = MaterialPageRoute(builder: (context)=> AlertPage());
            Navigator.push(context, route);
          } else if(opt['ruta'] == 'avatar'){
            final route = MaterialPageRoute(builder: (context)=> AvatarPage());
            Navigator.push(context, route);
          } else if (opt['ruta'] == 'card'){
            final route = MaterialPageRoute(builder: (context)=> CardsPage());
            Navigator.push(context, route);
          } else {
            _MessageSnack(context, 'OPCION INVALIDA');
          }
          //_MessageSnack(context, opt['ruta']);
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }

  void _MessageSnack(BuildContext context, String opt) {
    final snackBar = SnackBar(content: Text(opt));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
