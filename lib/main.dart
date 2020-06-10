import "package:flutter/material.dart";
import 'package:flutterburcrehberi/burcDetay.dart';
import 'package:flutterburcrehberi/burcListe.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Burç Rehberi",
      debugShowCheckedModeBanner: false,

      initialRoute: "/burcListe",
      routes: {
        "/": (context) => BurcListesi(),
        "/burcListe": (context) => BurcListesi(),

      },
      onGenerateRoute: (RouteSettings settings){
          List<String> pathElamanlari=settings.name.split("/");
          if(pathElamanlari[1]== "burcDetay"){
            return MaterialPageRoute(builder: (context) => BurcDetay(int.parse(pathElamanlari[2])));
          }
          return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),

    );
  }
}
